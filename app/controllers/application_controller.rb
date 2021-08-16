class ApplicationController < ActionController::Base
<<<<<<< HEAD
   before_action :configure_permitted_parameters, if: :devise_controller?
=======
    before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> 4dc3679ac781f03a68e6cb0bbe804406bf060102

  protected

  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
=======
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
>>>>>>> 4dc3679ac781f03a68e6cb0bbe804406bf060102
  end
end
