require 'rails_helper'

RSpec.describe 'Movies search' do
  it 'can get top rated movies', :vcr do
    response = TmdbService.top_rated_movies

    expect(response).to be_an Array
    expect(response[1]).to be_a Hash

    first_movie_data = response[1]

    expect(first_movie_data).to have_key :title
    expect(first_movie_data[:title]).to be_a String
  end

  it 'can search movies', :vcr do
    response = TmdbService.search_movies('Godfather')

    expect(response).to be_an Array
    expect(response[1]).to be_a Hash

    first_movie_data = response[1]

    expect(first_movie_data).to have_key :title
    expect(first_movie_data[:title]).to be_a String
  end

  it 'can get movie details', :vcr do
    response = TmdbService.movie_details(550)

    expect(response).to be_a Hash

    expect(response).to have_key :title
    expect(response[:title]).to be_a String
  end

  it 'can get movie credits', :vcr do
    response = TmdbService.movie_credits(550)

    expect(response).to be_a Hash
    expect(response[:cast]).to be_an Array

    first_actor_data = response[:cast][0]

    expect(first_actor_data).to have_key :name
    expect(first_actor_data[:name]).to be_a String
  end

  it 'can get movie reviews', :vcr do
    response = TmdbService.reviews(550)

    expect(response).to be_a Hash
    expect(response[:results]).to be_an Array

    first_review_data = response[:results][0]

    expect(first_review_data).to have_key :author
    expect(first_review_data[:author]).to be_a String
  end
end