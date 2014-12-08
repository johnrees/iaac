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
    respond_with(:admin,@group)
  end

private

  def group_params
    params.require(:group).permit!
  end

end
