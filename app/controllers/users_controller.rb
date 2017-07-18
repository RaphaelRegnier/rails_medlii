class UsersController < ApplicationController

  def show
  end

  def index
  end

  def user_params
  params.require(:user).permit(:name, :description, :photo)
  end
end
