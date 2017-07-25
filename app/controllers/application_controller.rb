class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  skip_before_action :authenticate_user!, only: [:home]

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :first_name, :last_name, :birth_date, :age, :location, :description, :photo]

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
