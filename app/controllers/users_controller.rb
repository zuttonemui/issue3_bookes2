class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(user.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
