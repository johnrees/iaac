require "application_responder"

class ApplicationController < ActionController::Base

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.referrer || login_url(goto: request.path)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def check_auth
    redirect_to login_url(goto: request.path), alert: "Not authorized" if current_user.nil?
  end

end
