class RegistrationsController < Devise::RegistrationsController

  def create
    super
    @user = User.create(sign_up_params)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user = User.update(account_update_params)
    redirect_to :back
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :birth_date, :location, :description, :photo)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :birth_date, :location, :description, :photo)
  end
end
