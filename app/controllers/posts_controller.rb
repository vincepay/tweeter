class PostsController < ApplicationController

  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])

  end

   def set_user
    @user = current_user
   end

   def post_params
     params.require(:post).permit(:content)
   end

end
