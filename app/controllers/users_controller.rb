class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only:[:logout, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_url
  end

  def show
    redirect_if_wrong_user(params[:id])
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
