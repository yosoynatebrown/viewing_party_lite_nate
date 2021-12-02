class TmdbFacade
  def self.create_top_rated_movies
    Rails.cache.fetch('top_rated_movies', :expires => 4.hour) do
      json = service.top_rated_movies
      json.map do |data|
        Movie.new(data)
      end
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

  def self.

  def service
    TmdbService.new
  end
end
