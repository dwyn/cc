class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_user, :logged_in?

  def ensure_logged_in
    redirect_to :root unless logged_in?
  end

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!@current_user
  end

  protected
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
