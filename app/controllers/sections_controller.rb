class SectionsController < ApplicationController
  before_filter :require_signed_in_student, :get_course

  def new
    @section = @course.sections.new
  end

  def create
    @section = @course.sections.new(section_params)
    if @section.save
      flash[:success] = 'Section created.'
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def index
    @sections = @course.sections
  end

  def show
    @section = @course.sections.find(params[:id])
  end

  def join
    if current_student.courses.include?(@course)
      flash[:error] = 'You have already joined a section for this course!'
    else
      @section = @course.sections.find(params[:id])
      SectionStudent.create(:section_id => @section.id, :student_id => current_student.id)
    end
    redirect_to course_url(@course)
  end

  private

    def get_course
      @course = Course.find(params[:course_id])
    end

    def section_params
      params.require(:section).permit(:number)
    end
end
