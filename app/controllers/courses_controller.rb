class CoursesController < ApplicationController

  before_filter :authorize

  def index
    @courses = Course.with_role([:tutor,:student,:coordinator,:assistant], current_user)
  end

  def show
    @course = Course.find(params[:id])
    @tutors = User.with_role(:tutor, @course)
  end

end
