class Admin::PaymentsController < Admin::AdminController

  def new
    @user = User.find(params[:user_id])
    @payment = Payment.new
  end

  def create
    @user = User.find(params[:user_id])
    @payment = @user.payments.create payment_params
    respond_with @payment, location: -> { admin_user_path(@user) }
  end

private

  def payment_params
    params.require(:payment).permit!
  end

end
