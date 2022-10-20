class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all.order('created_at DESC')
  end
  
  def new 
    
  end

  def create
    
  end

  private
end
