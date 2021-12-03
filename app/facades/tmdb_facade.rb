class TmdbFacade
  def self.create_top_rated_movies
    Rails.cache.fetch('top_rated_movies', :expires => 4.hour) do
      json = service.top_rated_movies
      json.map do |data|
        Movie.new(data)
      end
    end
  end

  def self.movie_details(id)
    Rails.cache.fetch('movie_details', :expires => 4.hour) do
      json = service.movie_details(id)
      movie = Movie.new(json)
      movie.add_details(json)
      json = service.movie_credits(id)
      movie.add_cast(json)
      movie
    end
  end

  def self.create_search_movies(search)
    Rails.cache.fetch('review', :expires => 4.hour) do
      json = service.search_movies(search)
      json.map do |data|
        Movie.new(data)
      end
    end
  end

  def service
    TmdbService.new
  end
end
