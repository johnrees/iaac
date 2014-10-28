class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
  end

private

  def user_params
    params.require(:user).permit!
  end

end
