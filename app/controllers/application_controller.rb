class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

helper_method :current_time


def current_time
  current_time = DateTime.now
end



# OPTIMIZE make current_time method give time in EST!!
def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
end

    
end


# Devise handles the current_user otherwise defined as...
# require 'ostruct'

# helper_method :current_user

# def current_user
#   @current_user ||= User.find session[:user_id] if session[:user_id]
#   if @current_user
#     @current_user
#   else
#     OpenStruct.new(name: 'Guest')
#   end
# end