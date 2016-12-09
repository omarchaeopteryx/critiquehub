require 'themoviedb'

class MoviesController < ApplicationController

  def index

    @title = params[:genre]
    @genre = Tmdb::Genre.find(params[:genre])
    render :index
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_id: params[:id])
    render :show
  end

end
