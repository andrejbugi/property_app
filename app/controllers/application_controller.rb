class ApplicationController < ActionController::Base
  include PropertiesHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    @show_sidebar = true if account_signed_in?
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name telephone
                                               url image image_cache company
                                               details cover_image cover_image_cache])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
