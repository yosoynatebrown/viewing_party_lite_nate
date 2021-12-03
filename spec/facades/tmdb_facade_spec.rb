require 'rails_helper'

RSpec.describe 'TMDB Facade' do
  it '.create_top_rated_movies', :vcr do
    movies = TmdbFacade.create_top_rated_movies
    
    expect(movies).to be_an Array
    movies.each do |movie|
      expect(movie).to be_a Movie
    end
  end

    it '.movie_details', :vcr do
    movie = TmdbFacade.movie_details(550)


    expect(movie).to be_a Movie
  end

    it '.create_search_movies', :vcr do
    movies = TmdbFacade.create_search_movies('Godfather')
    
    expect(movies).to be_an Array
    movies.each do |movie|
      expect(movie).to be_a Movie
    end
  end

    it '.create_reviews', :vcr do
    reviews = TmdbFacade.create_reviews(550)
    
    expect(reviews).to be_an Array
    reviews.each do |review|
      expect(review).to be_a Review
    end
  end
end