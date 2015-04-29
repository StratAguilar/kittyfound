class UsersController < ApplicationController
  
	layout 'main'

	before_action :confirm_logged_in, :except => [:new, :create]

  def account
    
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Account created"
  		redirect_to(:controller => 'access', :action => 'login')
  	else 
  		render("new")
  	end
  end

  def postshow
    @user = User.find(session[:user_id])
    @posts = @user.posts.newest_first
  end

  def edit
  	@user = User.find(session[:user_id])
  end

  def update
  	@user = User.find(session[:user_id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "Account data has been updated"
  		redirect_to(:action => 'index')
  	else 
  		render("edit")
  	end
  end

  def delete
  	@user = User.find(session[:user_id])
  end

  def destroy
  	user = User.find(session[:user_id]).destroy
  	flash[:noctice] = "Account Deleted"
  	redirect_to(:controller => 'access', :action => 'logout')
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :username, :phone)
  end
end
