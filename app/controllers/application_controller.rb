class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(user)
    flash[:notice] = "Привет, #{user.first_name} #{user.last_name}!"
    if user.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
