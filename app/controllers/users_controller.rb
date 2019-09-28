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
    # redirect_if_wrong_user(params[:id])
    if params[:id] != current_user.id.to_s
      flash[:error]="You may not access another user's data"
    end
    @user = current_user
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @user}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
