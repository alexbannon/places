class SessionsController < ApplicationController
  # def new
  # end

  def create
  user = User.find_by_username(params[:username])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to root_url
	  else
	    flash.now.alert = "Username or password is invalid."
	  end
	end

	def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  	# attach to above line if you want a notice => , notice: "Logged out!"
	end

end
