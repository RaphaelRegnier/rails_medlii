class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  end


  def after_sign_in_path_for(resource)
    if (current_user.birth_date.blank?) || (current_user.location.blank?)
      edit_user_path(current_user)
    else
      users_path
    end
  end
end
