class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :add_instruments, :update, :destroy]


  def show
    birthday = @user.birth_date
    now = Date.today
    @user_age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def index
 if params[:instrument_id]
      @users  =  Instrument.find(params[:instrument_id]).users
      @users = @users.where(:age => params[:min_age].to_i..params[:max_age].to_i)
    elsif
      @users = User.all
    end

    if current_user.birth_date.blank? || current_user.location.blank?
      flash[:notice] = "Please fill the birth date and address"
      redirect_to edit_user_path(current_user)
    else
      @users = User.all
    end
  end

  def edit
  end


  def update
    @user = current_user.update(user_params)
    redirect_to users_path
  end


  def destroy
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :location, :description, :photo, :age)
  end


  def set_user
    @user = User.find(params[:id])
  end
end

