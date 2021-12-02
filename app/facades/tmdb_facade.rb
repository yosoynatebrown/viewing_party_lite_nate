class TmdbFacade
  def self.create_top_rated_movies
    Rails.cache.fetch('top_rated_movies', :expires => 4.hour) do
      json = service.top_rated_movies
      id_array = json.map do |data|
        data[:id]
      end
      id_array = id_array[0..39]
      json = service.movie_details
      id_array.map do |id|
        service.movie_details

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
