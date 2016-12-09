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
    p review_params
    # review_params[:reviewer_id] = session[:user_id]

    @review = Review.new(review_params)
    if @review.save
      redirect_to movie_review_path(@review)
    else
      render :new, status: 422
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
    render :show
  end

  private

    def review_params
      params.require(:review).permit(:reviewer_id, :content, :conclusion, :score, :title, :movie_id)
    end
end
