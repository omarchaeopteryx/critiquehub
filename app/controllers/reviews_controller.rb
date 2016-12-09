class ReviewsController < ApplicationController

  def index
    @movies = Tmdb::Movie.popular
    render :index
  end

  def new
    @movie = Tmdb::Movie.detail(params[:id])
    @review = Review.new
    render :new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path
    else
      render :new
    end
  end
end
