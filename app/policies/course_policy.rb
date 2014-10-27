class CoursePolicy < ApplicationPolicy

  def create?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin or user.has_role? :tutor, record
  end

end