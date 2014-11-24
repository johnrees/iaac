class Admin::UsersController < Admin::AdminController

  def index
    @q = User.with_role(:student, :any).search(params[:q])
    @q.sorts = 'last_name asc' if @q.sorts.empty?
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit!
  end

end
