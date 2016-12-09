class Vmovie

  def initialize

  end

  def self.get_latest
    return Tmdb::Movie.popular
  end

end
