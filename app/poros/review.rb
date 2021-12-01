class Review
  attr_reader :movie_id, :author, :text

  def initialize(data)
    @movie_id = data[:movie_id]
    @author = data[:author]
    @text = data[:text]
  end

end
