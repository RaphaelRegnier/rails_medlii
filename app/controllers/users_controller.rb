class UsersController < ApplicationController
  before_action :set_user, only: [:show, :add_instruments, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new]

  def show
    birthday = @user.birth_date
    now = Date.today
    @user_age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_played_instrument_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to new_played_instrument_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :location, :email, :password, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
