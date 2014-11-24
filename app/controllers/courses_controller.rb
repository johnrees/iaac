class CoursesController < ApplicationController

  before_filter :check_auth

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.create course_params
    authorize @course
    respond_with @course
  end

  def index
    @courses = current_user.courses
    authorize @courses
    @course_roots = @courses.map{ |c| c.root }.sort!{ |a,b| a.name <=> b.name }.uniq
  end

  def edit
    @course = current_user.courses.find(params[:id])
    authorize @course
  end

  def update
    @course = current_user.courses.find(params[:id])
    authorize @course
    @course.update_attributes course_params
    respond_with @course
  end

  def show
    @course = Course.find(params[:id])
    redirect_to course_path(@course) unless request.path == course_path(@course)
    authorize @course
    # @course = current_user.courses.find(params[:id])
    @modules = @course.root.self_and_descendants.where.not(credits: nil)
  end

private

  def course_params
    params.require(:course).permit!
  end

end
