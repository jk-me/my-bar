class ApplicationController < ActionController::Base

  def root

  end


   def redirect_if_not_logged_in
     if session[:user_id] == nil
       flash[:error]="You have to be logged in to do that"
       redirect_to "/"
     end
   end
end
