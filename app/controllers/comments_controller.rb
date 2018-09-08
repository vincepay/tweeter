class CommentsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @comments =Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create 
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_comments(@post)
    else 
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comments(@post)
  end

  private
  

  def comment_params
    params.require(:artist).permit(:name)
  end


end
