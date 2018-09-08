class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @comments =Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @post.comments.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create 
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to [@post, @comment]
    else 
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comments(@post)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name)
  end


end
