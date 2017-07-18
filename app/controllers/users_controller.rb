class UsersController < ApplicationController

  def show
  end

  def index
    @users = User.all
  end

  def add_instruments
    @user = User.find(params[:id])
    @played_instrument = PlayedInstrument.new()
  end

  private

  def user_params
  params.require(:user).permit(:name, :description, :photo)
  end

end
