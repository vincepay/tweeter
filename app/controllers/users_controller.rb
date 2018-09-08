class UsersController < ApplicationController
  def index
    @users = User.all
    redirect_to posts_path
  end

  def show
  end

  def new
  end
end
