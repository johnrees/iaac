class Admin::UsersController < Admin::AdminController

  def modify
    # render text: params.inspect
    @users = User.where(id: params[:user_ids].reject(&:blank?).map(&:to_i))
    if params["delete-selected"]
      @users.destroy_all
      return redirect_to admin_users_path, notice: 'Users destroyed'
    elsif params["add-to-group"]
      group = Group.find(params["group"]["group_id"])
      group.users << [@users - group.users]
      # begin
      # rescue ActiveRecord::RecordNotUnique => e
      # end

      return redirect_to admin_users_path, notice: 'Users added to group'
    end
  end

  def index
    @q = User.search(params[:q])
    # @q.sorts = 'last_name asc' if @q.sorts.empty?
    @users = @q.result(distinct: true)
    # authorize @users
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  def edit
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.find(params[:id])
    # authorize @user
    @user.update_attributes user_params
    respond_with(:admin,@user)
  end

private

  def user_params
    params.require(:user).permit!
  end

end
