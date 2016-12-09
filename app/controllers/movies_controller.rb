require 'themoviedb'

class MoviesController < ApplicationController

  def index

    @title = params[:genre]
    @genre = Tmdb::Genre.find(params[:genre])
    render :index
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    render :show
  end


end




# require 'themoviedb'
# require 'json'


# latest = Tmdb::Movie.now_playing
# # x = Tmdb::Movie.find("batman").each {|object| p object.id}
# # x.each { |movie| puts movie.title }
# # result = x.first

# @movie = Tmdb::Movie.images(414)

# @movie.each {|key, value| p key}

# def find_image_url(movie)
# "https://image.tmdb.org/t/p/w500" +
# movie["posters"].first["file_path"]
# end

# p find_image_url(@movie)

# # p @movie["posters"].first["file_path"]
# # p result.id

# # batman = Tmdb::Movie.detail(186579)
# # batmanparse = batman.to_json
# # p batmanparse2 = JSON.parse(batmanparse)
# # p drama = Tmdb::Genre.find("Action")


# # latest.class
# # p latest
