class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :add_instruments, :edit, :destroy]

  def show
    birthday = @user.birth_date
    now = Date.today
    @user_age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def age(birthday)

  end
end
