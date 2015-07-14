



class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	layout :layout_by_resource

	def profile
	end

	protected

  	def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me , :role) }
	    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me, :role) }
	    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password , :role) }
  	end
  	
  	rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to  root_url
end


  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'create'
      "devise"
    else
      "application"
    end
  end




end
