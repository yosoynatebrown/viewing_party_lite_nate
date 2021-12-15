class TmdbFacade
  def self.create_top_rated_movies
      json = TmdbService.top_rated_movies
      json.map do |data|
        Movie.new(data)
      end
  end

  def self.movie_details(id)
      json = TmdbService.movie_details(id)
      movie = Movie.new(json)
      movie.add_details(json)
      json = TmdbService.movie_credits(id)
      movie.add_cast(json)
      movie
  # end
  end

  def self.create_search_movies(search)
      json = TmdbService.search_movies(search)
      json.map do |data|
        Movie.new(data)
      end
    # end
  end

  def self.create_reviews(movie_id)
    
      json = TmdbService.reviews(movie_id)
    
      json[:results].map do |data|
        Review.new(movie_id, data)
      end
    # end
  end
end
