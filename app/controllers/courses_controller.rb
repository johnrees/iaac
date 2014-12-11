class CoursesController < ApplicationController

  before_filter :check_auth

  def index
    @courses = current_user.courses.arrange(order: :name)
    # .where(published: true)
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
    @course = Course.includes(:students,:tutor_members => :user).find(params[:id])
    authorize @course
    # @ids = Course.with_role([:tutor,:student,:coordinator,:assistant], current_user).select(:id).pluck(:id)
    @grade = @course.gradeable? ? Grade.where(student: current_user, course: @course).first : nil
    @modules = @course.root.subtree
  end

private

  def course_params
    params.require(:course).permit!
  end

end
