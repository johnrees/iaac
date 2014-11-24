class CoursePolicy < ApplicationPolicy

  def index?
    user
  end

  def create?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin or user.has_role? :tutor, record
  end

  def destroy?
    user.has_role? :admin
  end

end