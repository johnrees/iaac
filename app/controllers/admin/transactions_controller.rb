class Admin::TransactionsController < Admin::AdminController

  def new
    @user = User.find(params[:user_id])
    @transaction = Transaction.new
  end

  def create
    @user = User.find(params[:user_id])
    @transaction = @user.transactions.create transaction_params
    respond_with @transaction, location: -> { admin_user_path(@user) }
  end

private

  def transaction_params
    params.require(:transaction).permit!
  end

end
