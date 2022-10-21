class UsersController < ApplicationController
  def user_posts
    @posts = current_user.posts
  end
end
