class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to user_path
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @users = User.all
    @user = current_user
  end
  
  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    is_matching_login_user
    
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      @user=User.find(params[:id])
      @user.update(user_params)
      render :edit
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end
