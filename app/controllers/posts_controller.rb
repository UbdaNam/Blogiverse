class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = User.find(@user_id).posts
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = User.find(@user_id).posts.find(@post_id)
    @user_name = User.find(@user_id).name
    puts @post.comments.to_json
  end
end
