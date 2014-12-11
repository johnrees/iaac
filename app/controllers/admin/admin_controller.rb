class Admin::AdminController < ApplicationController

  layout 'admin'
  before_filter :check_admin

  def dashboard
  end

private

  def check_admin
    redirect_to root_path unless current_user and current_user.is_admin?
  end

end
