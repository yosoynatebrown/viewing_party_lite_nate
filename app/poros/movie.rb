class Movie
  attr_reader :title, :vote_average, :genre, :summary, :cast, :length

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genre = data[:genre]
    @summary = data[:summary]
    @cast = data[:cast]
    @length = data[:length]
  end
  
end
