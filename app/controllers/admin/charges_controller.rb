class Admin::ChargesController < Admin::AdminController

  def new
    @user = User.find(params[:user_id])
    @charge = Charge.new
  end

  def create
    @user = User.find(params[:user_id])
    @charge = @user.charges.create charge_params
    respond_with @charge, location: -> { admin_user_path(@user) }
  end

private

  def charge_params
    params.require(:charge).permit!
  end

end
