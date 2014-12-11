class GradePolicy < ApplicationPolicy

  def show?
    false
  end

  def new?
    false
  end

  def edit?
    false
  end

  def index?
    user.is_admin? || user.courses_being_taught.pluck(:id).include?(record.course_id)
  end

  def create?
    user.courses_being_taught.pluck(:id).include?(record.course_id)
  end

  def update?
    user.courses_being_taught.pluck(:id).include?(record.course_id)
  end

end
