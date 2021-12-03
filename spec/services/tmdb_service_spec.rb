require 'rails_helper'

RSpec.describe 'Govt Search' do
  it 'can get all senator data', :vcr do
    service = TmdbService.new
    response = service.top_rated_movies

    expect(response).to be_a Hash
    expect(response[:results][0][:members]).to be_an Array

    first_senator_data = response[:results][0][:members].first

    expect(first_senator_data).to have_key :first_name
    expect(first_senator_data[:first_name]).to be_a String

    expect(first_senator_data).to have_key :last_name
    expect(first_senator_data[:last_name]).to be_a String

    expect(first_senator_data).to have_key :twitter_account
    expect(first_senator_data[:twitter_account]).to be_a String
  end
end