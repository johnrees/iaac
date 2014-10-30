class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit!
  end

end
