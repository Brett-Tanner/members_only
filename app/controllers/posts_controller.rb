class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all.order('created_at DESC')
  end
  
  def new 
    
  end

  def create
    
  end

  private

  def require_login
    
  end
end
