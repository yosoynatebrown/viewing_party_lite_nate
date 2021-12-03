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
    click_button('Top Movies')
    click_link('The Godfather')
  end

  it 'shows Movie Details' do
    expect(page).to have_content("Movie Details")
  end

  it 'has a button to go to discover movies' do
    click_button('Discover Movies')

    expect(page).to have_current_path("/users/#{@nate.id}/discover")
  end

  it 'has a button to create viewing party' do
    click_button('Create Viewing Party')

    expect(page).to have_current_path("/users/#{@nate.id}/movies/238/viewing_parties/new")
  end

  it 'shows the movie title, rating, runtime, genres, summary, cast, # of reviews' do
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Rating: 8.7")
    expect(page).to have_content("Runtime: 2:55")
    expect(page).to have_content('Genres: ["Drama", "Crime"]')
    expect(page).to have_content('Summary: Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    expect(page).to have_content('Cast: ["Marlon Brando", "Al Pacino", "James Caan", "Robert Duvall", "Richard S. Castellano", "Diane Keaton", "Talia Shire", "Gianni Russo", "Sterling Hayden", "Al Lettieri"]')
    expect(page).to have_content("# of Reviews: 15133")

  end


end
