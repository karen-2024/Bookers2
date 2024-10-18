class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  def book
    return Book.find(self.book_id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end