class CoursePolicy < ApplicationPolicy

  def update?
    user.has_role? :admin or user.has_role? :tutor, record
  end

end