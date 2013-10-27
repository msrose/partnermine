class StudentsController < ApplicationController
  def new
    redirect_to student_url(current_student) if signed_in?
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to signin_path
    else
      render :new
    end
  end

  def show
    require_signed_in_student
    @student = Student.find(params[:id])
    redirect_to student_url(current_student) unless @student == current_student
    @sections = @student.sections
    @requests_made = Partnership.where(:from_id => current_student.id, :accepted => false)
    @requests_received = Partnership.where(:to_id => current_student.id, :accepted => false)
    @partnerships = Partnership.where("to_id = :id OR from_id = :id", :id => current_student.id).where(:accepted => true)
  end

  def make_request
    @student = Student.find(params[:id])
    @section = Section.find(params[:section])
    if @student.sections.include?(@section) && current_student.sections.include?(@section)
      if Partnership.create(:from_id => current_student.id, :to_id => @student.id, :section_id => @section.id)
        flash[:success] = "Request Sent!"
        redirect_to root_url
      else
        flash[:error] = "Invalid request!"
        redirect_to :back
      end
    else
      flash[:error] = "Invalid request!"
      redirect_to :back
    end
  end

  def accept_request
    @request_to_accept = Partnership.find(params[:request_received])
    @request_to_accept.update_attribute(:accepted, true)
    redirect_to root_url
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
end