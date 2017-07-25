class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :add_instruments, :edit, :destroy]

  def show
    birthday = @user.birth_date
    now = Date.today
    @user_age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def index
    if params[:instrument_id]
      played_instruments_params = { instrument_id: params[:instrument_id] }

      unless params[:level].empty?
        played_instruments_params[:level] = params[:level]
      end

      @users  =  User.joins(:played_instruments).where(played_instruments: played_instruments_params)

      unless params[:min_age].empty? && params[:max_age].empty?
        @users = @users.where(:age => params[:min_age].to_i..params[:max_age].to_i)
      end
    elsif
      @users = User.all
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :photo, :instrument_id, :age, :location)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def age(birthday)
  end
end
