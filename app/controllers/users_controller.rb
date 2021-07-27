class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books.all

    @new_book = Book.new
  end

  def index
    @user = current_user
    @user_list= User.all

    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user), notice:'You have updated user successfully.'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end