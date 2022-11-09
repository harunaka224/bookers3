class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  end
  
  def show
  end

  def index
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
