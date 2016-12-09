class ReviewsController < ApplicationController

  def index
    @movies = Tmdb::Movie.popular
    @reviews = Review.all.sort_by {|review| review.comments.count }
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
      redirect_to movie_review_path(@review.movie_id, @review.id)
    else
      render :new, status: 422
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
    @comments = @review.comments
    render :show
  end

  private

    def review_params
      params.require(:review).permit(:reviewer_id, :content, :conclusion, :score, :title, :movie_id)
    end
end
