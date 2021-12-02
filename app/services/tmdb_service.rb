class TmdbService
  def top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org/3")

    response = conn.get("/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def search_movies(search)
    conn = Faraday.new(url: "https://api.themoviedb.org/3")

    response = conn.get("/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&query=#{search}&page=1&include_adult=false")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  # def reviews
  #   response = get_url('https://api.themoviedb.org/3').get("little-esty-shop/contributors")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.get_url(url)
    Faraday.new(url)
  end

end
