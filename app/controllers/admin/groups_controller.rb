class Admin::GroupsController < Admin::AdminController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.create group_params
    respond_with [:admin,@group], location: admin_groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_with(:admin,@group)
  end

private

  def group_params
    params.require(:group).permit!
  end

end
