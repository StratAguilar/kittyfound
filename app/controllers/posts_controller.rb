class PostsController < ApplicationController

  layout 'main'

  before_action :confirm_logged_in, :except => [:index, :show, :logout, :lost, :found]
  
  def lost
    @posts = Post.lost.newest_first
  end

  def found 
    @posts = Post.found.newest_first
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post[:user_id])
  end

  def new
    @post = Post.new()
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to(:action => 'lost')
    else
      render('new')
    end
  end
        

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
      redirect_to(:controller => 'users', :action => 'postshow')
    else
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id]).destroy
    flash[:notice] = "Post destroyed successfully."
    redirect_to(:controller => 'users', :action => 'postshow')
  end

  private

    def post_params
      params.require(:post).permit( :post_type, :title, :description, 
                                    :city, :date, :county, :image,
                                    :cat_breed, :cat_color, :cat_coat)
    end

end
