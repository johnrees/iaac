class GradesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @grades = @course.grades
  end
end
