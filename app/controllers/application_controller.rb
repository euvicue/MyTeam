class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception

  def index
  end

  def check_privileges!
  	redirect_to "/", alert: 'You dont have enough permissions to be here' unless current_user.admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end
end
