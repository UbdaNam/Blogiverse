class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_id = params[:id]
    @user = User.find(@user_id)
    puts @user.to_json
    puts @user.posts.to_json
  end
end
