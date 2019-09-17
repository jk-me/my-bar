class ApplicationController < ActionController::Base

  def root

  end

  def current_id
    render json: {id: current_user.id}
  end

  def redirect_if_not_logged_in
   if session[:user_id] == nil
     flash[:error]="You have to be logged in to do that"
     redirect_to "/"
   end
  end

  def redirect_if_wrong_user (x)
   if x != current_user.id.to_s
     flash[:error]="You may not access another user's data"
     redirect_to user_path(current_user)
   end
  end

  def current_user
   User.find(session[:user_id])
  end

end
