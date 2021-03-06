class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone_number])
  end

  def after_sign_up_path_for(resource)
    customers_path
  end


  def after_sign_in_path_for(resource)
    if customer_signed_in?
      root_path
    else
      admin_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :customer
      root_path
    else
      new_admin_session_path
    end
  end


end
