class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  protected

  def configure_devise_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :first_name, :last_name, :birth_date, :age, :location, :photo, :description, :song]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) {
        |u| u.permit(permitted_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit(permitted_params)
      }
    end
  end
end
