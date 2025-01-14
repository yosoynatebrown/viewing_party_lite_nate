class TmdbService
  def self.top_rated_movies
    conn = get_url(url: "https://api.themoviedb.org")

    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.search_movies(search)
    conn = get_url(url: "https://api.themoviedb.org")

    response = conn.get("/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&query=#{search}&page=1&include_adult=false")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.movie_details(movie_id)
    conn = get_url(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb_key']}&language=en-US")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_credits(movie_id)
    conn = get_url(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")

    JSON.parse(response.body, symbolize_names: true)
  end


  def self.reviews(movie_id)
    conn = get_url(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['tmdb_key']}&language=en-US")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_url(url)
    Faraday.new(url)
  end

end
