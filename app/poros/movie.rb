class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :vote_count,
              :genres,
              :summary,
              :cast,
              :length,
              :poster_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @summary = data[:overview]
    @genres = []
    @cast = []
    @length = 0
    @poster_path = ''
  end

  def add_details(data)
    @genres = data[:genres].map {|genre| genre[:name]}
    @length = data[:runtime]
    @poster_path = data[:poster_path]
  end

  def length_hours
    "#{@length / 60}:#{@length % 60}"
  end

  def add_cast(data)
    @cast = data[:cast].map {|cast| cast[:name]}
  end
end
