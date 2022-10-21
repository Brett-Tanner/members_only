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
      redirect_to new_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
