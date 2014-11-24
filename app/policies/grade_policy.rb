class GradePolicy < ApplicationPolicy

  def index?
    user
  end

  def create?
    true
  end

end
