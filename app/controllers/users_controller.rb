class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  end

  def show
  end

  def index

  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
