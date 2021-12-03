class Review
  attr_reader :movie_id, :author, :text

  def initialize(movie_id, data)
    @movie_id = movie_id
    @author = data[:author]
    @text = data[:content]
  end

end
