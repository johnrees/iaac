class UsersController < ApplicationController

  layout Proc.new{ request.xhr? ? false : 'application' }

  before_filter :check_auth, except: [:new, :create, :invite]

  def invite
    session[:user_id] = nil
    if @user = User.where(invitation_code: params[:invitation_code]).first
      session[:user_id] = @user.id
      render :invite
    else
      render text: 'User not found'
    end
  end

  def index
    @students = User.that_study.order(:last_name)
    @tutors = User.that_teach.order(:last_name) - @students
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
    if @user.save
      @user.update_attribute :invitation_code, nil
      redirect_to @user, notice: 'Details updated successfully'
    else
      render @user.invitation_code.blank? ? :edit : :invite
    end
    # respond_with @user
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
      :description,
      :dob,
      :gender
    )
  end

end
