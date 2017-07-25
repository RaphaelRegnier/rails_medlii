class UsersController < ApplicationController


  before_action :set_user, only: [:show, :edit, :add_instruments, :destroy]


  def show
  end

  def index
    if current_user.birth_date.blank? || current_user.location.blank?
      flash[:notice] = "Please fill the birth date and address"
      redirect_to edit_user_path(current_user)
    elsif

      if params[:instrument_id]
        played_instruments_params = { instrument_id: params[:instrument_id] }

        unless params[:level].empty?
          played_instruments_params[:level] = params[:level]
        end

        @users  =  User.joins(:played_instruments).where(played_instruments: played_instruments_params)

        unless params[:min_age].empty? && params[:max_age].empty?
          @users = @users.where(:age => params[:min_age].to_i..params[:max_age].to_i)
        end
      else
        @users = User.all
      end
    end
  end

  def edit
  end


  def update
    if params[:user][:birth_date].include? '/'
      current_user.update(other_user_params)
      current_user.birth_date = Date.strptime(params[:user][:birth_date], "%m/%d/%Y")
    else
      current_user.update(user_params)
    end
    # current_user.save
    # current.birth_date
    # birthday = Date.strptime(current_user.birth_date, '%Y-%m-%d')
    # now = Date.today
    # current_user.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    current_user.age = (Date.today - current_user.birth_date) / 365
    current_user.save
    redirect_to users_path
  end


  def destroy
  end

  private

  def user_params

    params.require(:user).permit(:first_name, :last_name, :birth_date, :location, :description, :photo, :age, :song)

  end

  def other_user_params
    params.require(:user).permit(:first_name, :last_name, :location, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
