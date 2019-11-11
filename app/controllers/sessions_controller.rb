class SessionsController < ApplicationController

  def new #login form
    @user = User.new
  end

  def create #submit login
    @user = User.find_by(name: sess_params[:name])
    if @user
      if @user.authenticate(sess_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = 'Wrong username or password.'
        redirect_to new_session_path
      end
    else
      flash[:error] = 'Wrong username or password.'
      redirect_to new_session_path
    end
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.urlsafe_base64(n=6)
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def logout
    session.delete(:user_id)
    redirect_to root_url
  end

  private

  def sess_params
    params.require(:user).permit(:name, :password)
  end

  def auth
    request.env['omniauth.auth']
  end

end
