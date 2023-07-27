class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = User.find(@user_id).posts.find(@post_id)
    @user_name = User.find(@user_id).name
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      p "PASSED", @post
      redirect_to user_post_path(current_user)
    else
      p "FAILED", @post
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
