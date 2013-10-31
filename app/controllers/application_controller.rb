class ApplicationController < ActionController::Base
  include Pundit
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:username, :role]
  end

private

  def user_not_authorized
    flash[:error] = "You do not have the proper permission to do this action"
    redirect_to request.headers["Referer"] || root_path
  end

end
