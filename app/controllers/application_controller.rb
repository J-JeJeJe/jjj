class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_in_path_for(resource)
    if member_signed_in?
      root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
