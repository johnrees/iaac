class UsersController < ApplicationController

  before_filter :authorize, except: [:new, :create]

  def index
    @users = User.with_role(:student, :any).uniq.order(:last_name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    session[:user_id] = @user.id if @user
    respond_with @user
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :public_email,
      :private_email,
      :password,
      :password_confirmation)
  end

end
