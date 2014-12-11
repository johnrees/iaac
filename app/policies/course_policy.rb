class CoursePolicy < ApplicationPolicy

  def index?
    user
  end

  def show?
    user.is_admin? || user.course_ids.include?(record.id)
  end

  def update?
    user.courses_being_taught.pluck(:id).include?(record.id)
  end

end
