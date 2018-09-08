class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_user

  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = Post.new
    render partial: "form"
  end

  def create
    @post = current_user.posts.new(post_params)
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
   def set_post
    @post = current_user.posts.find(params[:id])
   end

   def set_user
    @user = User.find(params[:user_id])
   end

   def post_params
     params.require(:post).permit(:content, :user_id)
   end

end
