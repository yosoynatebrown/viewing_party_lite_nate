require 'rails_helper'

# Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party

RSpec.describe 'New Viewing Party Page' do
  let(:data) { {
    id: 1,
    title: 'The Matrix',
    vote_average: 7.7,
    vote_count: 100,
    summary: 'A guy named Neo does stuff',
    length: 120
  } }
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')
    @movie = Movie.new(data)
    
    visit "/users/#{@nate.id}/movies/#{@movie.id}/viewing_parties/new"
  end

  it 'has the duration of party with default of movie runtime' do

  end

  it 'has a field to select date' do

  end

  it 'has a field to select start time' do

  end

  it 'has a checkbox next to each existing user in system' do

  end

  it 'has a button to create a party' do

  end
end
