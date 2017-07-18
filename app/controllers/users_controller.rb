class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def add_instruments
    @instruments = Instrument.all
    @user = User.find(params[:id])
    @played_instrument = PlayedInstrument.new()
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
end
