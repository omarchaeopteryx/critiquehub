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

  def search
    @movies = Tmdb::Movie.find(search_params)
    @search_term = search_params
  end

  private

    def search_params
      params.require(:search)
    end

end
