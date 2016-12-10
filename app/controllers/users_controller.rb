class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}."
      redirect_to user_path(@user)
    else
      render :new, status: 422
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :type_of_user)
    end

    def require_user
      redirect_to login_path if !logged_in?
    end
end
