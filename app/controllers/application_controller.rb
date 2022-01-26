class ApplicationController < ActionController::Base

  private

  def configure_permitted_parameters
    added_attrs = [ :last_name,
                    :first_name,
                    :email,
                    :zipcode,
                    :address,
                    :phone_number,
                    :password,
                    :password_confirmation,
                  ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
