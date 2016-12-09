class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to movie_reviews_path(comment.review_id)
  end

  private

  def review_params
    params.require(:comment).permit(:review_id, :user_id, :description)
  end
end
