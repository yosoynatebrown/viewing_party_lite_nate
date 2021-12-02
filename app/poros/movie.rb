class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :summary,
              :cast,
              :length

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @summary = data[:overview]
    @genres = []
    @cast = []
    @length = ""
  end

  def add_details(data)
    @genres = data[:genres].map {|genre| genre[:name]}
    @length = "#{(data[:runtime] / 60)}:#{data[:runtime] % 60}"
  end

  def add_cast(data)
    @cast = data[:cast].map {|cast| cast[:name]}
  end

end
