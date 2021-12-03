require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')
    @billy = User.create!(name: 'Billy', email: 'billy@fake.com')
    @jack = User.create!(name: 'Jack', email: 'jack@nate.com')
    @lucy = User.create!(name: 'Lucy', email: 'lucy@nate.com')

    @party = ViewingParty.create!(length: 150,
                                  host_id: @nate.id,
                                  start_time: Time.now,
                                  date: Date.today,
                                  movie_id: 550)
    @party.users << @nate
    @party.users << @billy
    @party.users << @jack

    visit "/users/#{@nate.id}/discover"
  end
  it 'shows discover page' do
    expect(page).to have_content("Discover Page")
  end

  it 'can search for movies' do
    fill_in :movie, with: 'Click'
    click_button('Search for Movie')
    expect(page).to have_current_path("/users/#{@nate.id}/movies?utf8=✓&movie=Click&commit=Search+for+Movie")
  end

  it 'has a button to search top movies' do
    click_button('Top Movies')

    expect(page).to have_current_path("/users/#{@nate.id}/movies?q=top_rated")

  end
end
