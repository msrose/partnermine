class SectionsController < ApplicationController
  before_filter :get_course

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

  private

    def get_course
      @course = Course.find(params[:course_id])
    end

    def section_params
      params.require(:section).permit(:number)
    end
end
