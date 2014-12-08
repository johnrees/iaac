class GradesController < ApplicationController

  respond_to :html, :js

  def submit_for_review
    @course = Course.find(params[:course_id])
    render text: 'sent'
  end

  def index
    @course = Course.find(params[:course_id])
    @tutors = @course.tutors
    @grades = @course.grades
    authorize @grades
  end

  def create
    @course = Course.find(params[:course_id])
    @grade = @course.grades.find_or_create_by(student_id: grade_params[:student_id])
    @grade.grader = current_user
    authorize @grade
    @grade.update_attributes grade_params

    # @grade = @course.grades.create grade_params


    # @grade.save!
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
