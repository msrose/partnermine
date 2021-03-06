class CoursesController < ApplicationController
  before_filter :require_signed_in_student

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = 'Course created.'
      redirect_to courses_path
    else
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @sections = @course.sections
  end

  private

    def course_params
      params.require(:course).permit(:code)
    end
end
