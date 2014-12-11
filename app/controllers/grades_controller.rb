class GradesController < ApplicationController

  before_filter :check_auth
  respond_to :html, :js

  def submit_for_review
    @course = Course.find(params[:course_id])
    render text: 'sent'
  end

  def index
    @course = Course.find(params[:course_id])
    @tutors = @course.tutors - [current_user]
    @grades = @course.grades
    # authorize @grades
    @can_grade = current_user.courses_being_taught.pluck(:id).include? @course.id
  end

  def create
    @course = Course.find(params[:course_id])
    # @grade = @course.grades.find_or_create_by(student_id: grade_params[:student_id], grader: current_user)
    @grade = Grade.find_or_create_by({ student_id: grade_params[:student_id], course_id: params[:course_id], grader_id: current_user.id })
    authorize @grade
    @grade.update_attributes grade_params
    respond_with([@course,@grade], location: course_grades_path(@course))
  end

  def update
    @course = Course.find(params[:course_id])
    @grade = Grade.find(params[:id])
    # @grade = Grade.find(params[:id])
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
