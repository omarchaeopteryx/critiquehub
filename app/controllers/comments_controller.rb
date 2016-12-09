class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to movie_review_path(@comment.review.movie_id, @comment.review_id)
    else
      render :new, status: 422
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:review_id, :user_id, :description)
  end
end
