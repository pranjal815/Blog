class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  layout 'author'


  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) { |authors_params| authors_params.permit(:name, :email, :password, :avatar) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :current_password, :avatar])
    #devise_parameter_sanitizer.for(:account_update) { |authors_params| authors_params.permit(:name, :email, :password, :current_password, :avatar) }
  end



end
