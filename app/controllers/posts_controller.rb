class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all.order('created_at DESC')
  end
  
  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.order('created_at DESC')
    @user = current_user
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path, notice: "#{@post.title} deleted successfully"
    else
      flash.alert "Failed to delete #{@post.title}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
