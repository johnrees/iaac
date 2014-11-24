class GradesController < ApplicationController

  respond_to :html, :js

  def index
    @course = Course.find(params[:course_id])
    @grades = @course.grades
    authorize @grades
  end

  def create
    @course = Course.find(params[:course_id])
    @grade = @course.grades.create grade_params
    @grade.grader = current_user
    authorize @grade
    @grade.save!
    respond_with([@course,@grade], location: course_grades_path(@course))
  end

  def update
    @course = Course.find(params[:course_id])
    @grade = Grade.find(params[:id])
    # @grade.grader = current_user
    authorize @grade
    @grade.update_attributes grade_params
    respond_with([@course,@grade], location: course_grades_path(@course))
  end

private

  def grade_params
    params.require(:grade).permit!
  end

end
