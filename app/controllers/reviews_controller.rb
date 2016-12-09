class ReviewsController < ApplicationController

  def index
    @movies = Tmdb::Movie.popular
    render :index
  end

end
