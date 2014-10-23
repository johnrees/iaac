class CoursesController < ApplicationController

  before_filter :authorize

  def index
    @courses = current_user.courses
  end

  def show
    @course = current_user.courses.find(params[:id])
  end

end
