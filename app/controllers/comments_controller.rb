class CommentsController < ApplicationController
  def index

  end

  def show
    @comment = 
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
      redirect_to


end
