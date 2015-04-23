class AccessController < ApplicationController

	layout 'main'

  def index
  	# display text and links
  end

  def login
  	# login form 
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first

  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

  	if authorized_user
  		session[:user_id] = authorized_user.user_id
  		session[:useremail] = authorized_user.email

  		flash[:notice] = "Logged In"
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Invalid username/password combiniation."
  		redirect_to(action => 'login')
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:user_email] = nil

  	flash[:notice] = "Logged out"
  	redirect_to(:action => 'login')

  end
end
