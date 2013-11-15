class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(
      :email,
      :password,
      :password_confirmation,
      :name
    )}
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(
      :email,
      :password,
      :password_confirmation,
      :name
    )}
  end
end
