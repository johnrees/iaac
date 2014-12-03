class UsersController < ApplicationController

  layout Proc.new{ request.xhr? ? false : 'application' }

  before_filter :check_auth, except: [:new, :create, :invite]

  def invite
    if @user = User.where(invitation_code: params[:invitation_code]).first
      session[:user_id] = @user.id
      render :invite
    else
      render text: 'User not found'
    end
  end

  def index
    @users = User.all.order(:last_name)
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes user_params
    respond_with @user
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
      :password_confirmation,
      :country_code,
      :photo,
      :description
    )
  end

end
