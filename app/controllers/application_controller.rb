class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?

  	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_number])
		# devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :invitation_token, :phone_number, :phone_verification_code, :user_role])
	end


  	def after_sign_in_path_for(resource_or_scope)
  		user_path(current_user.id)
    end

end
