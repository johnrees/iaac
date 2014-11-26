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
    courses = current_user.courses.pluck('courses.ancestry,courses.id')
    ids = courses.map(&:last)
    courses = courses.map{ |a| a.reject(&:blank?).first.to_s.split('/').first }.uniq

    @courses = Course.select('courses.*').where(
      "courses.id IN (?) OR courses.ancestry LIKE ANY (array[?]) OR courses.ancestry IN (?)",
      courses,
      courses.map{|val| "#{val}%" },
      courses
    ).arrange(order: :name)

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
    @grade = Grade.where(student: current_user, course: @course).first
    authorize @course
    @modules = @course.root.subtree
  end

private

  def course_params
    params.require(:course).permit!
  end

end
