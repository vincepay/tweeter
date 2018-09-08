class PostsController < ApplicationController

  before_action :set_user

  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = @user.posts.new
    render partial: "form"
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to current_user.posts
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    render partial: "form"
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private

   def set_user
    @user = current_user
   end

   def post_params
     params.require(:post).permit(:content, :user_id)
   end

end
