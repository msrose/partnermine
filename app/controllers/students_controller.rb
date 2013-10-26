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
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
end
