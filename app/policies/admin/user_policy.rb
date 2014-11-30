class Admin::UserPolicy < AdminPolicy

  def index?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end

  def edit?
    user.has_role? :admin
  end

  def new?
    user.has_role? :admin
  end

end
