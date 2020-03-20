class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def default_url_options
    if I18n.locale == I18n.default_locale
      { }
    else
      { lang: I18n.locale }
    end
  end

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

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
