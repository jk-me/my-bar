class SessionsController < ApplicationController

  def new #login
    @user = User.new
  end

  def create #submit login
    # byebug
    @user = User.find_by(name: sess_params[:name])
    return head(:forbidden) unless @user.authenticate(sess_params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def fbcreate

  end

  private

  def sess_params
    params.require(:user).permit(:name, :password)
  end

end
