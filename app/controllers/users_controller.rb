class UsersController < ApplicationController

   before_action :set_user, only: [:edit, :update]

  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @user = User.find(params[:id])
    @following = @user.following_users
  end

  def follower
    @user = User.find(params[:id])
    @follower = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :age, :area,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
