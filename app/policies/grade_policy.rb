class GradePolicy < ApplicationPolicy

  def index?
    user.has_role?(:tutor, :any) || user.has_role?(:admin)
  end

  def create?
    user.has_role?(:tutor, record.course) || user.has_role?(:admin)
  end

  def update?
    user.has_role?(:tutor, record.course) || user.has_role?(:admin)
  end

end
