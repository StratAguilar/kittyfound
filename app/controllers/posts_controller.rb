class PostsController < ApplicationController

  layout 'main'

  before_action :confirm_logged_in, :except => [:index, :show, :logout]
  
  def lost
    @posts = Post.lost.newest_first
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
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
      redirect_to(:action => 'show', id => @page.id)
    else
      render('edit')
    end
  end

  def delete
  end

  private

    def post_params
      params.require(:post).permit(:type, :title, :description, :city, :date)
    end

end
