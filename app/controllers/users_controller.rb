class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    @users = User.all
    @new_book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was succuessfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

end