require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @billy = User.create!(name: 'Billy', email: 'billy@fake.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @jack = User.create!(name: 'Jack', email: 'jack@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @lucy = User.create!(name: 'Lucy', email: 'lucy@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')

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

  it 'shows movie results' do
    click_button('Top Movies')

    expect(page).to have_content("Movie Results")
  end

  it 'has a button to go to discover movies' do
    click_button('Top Movies')
    click_button('Discover Movies')

    expect(page).to have_current_path("/users/#{@nate.id}/discover")
  end

  it 'shows names of movies with a link to movie show page' do
    click_button('Top Movies')

    expect(page).to have_link("The Godfather")
  end

  it 'shows vote average for each movie displayed' do
    click_button('Top Movies')

    expect(page).to have_content("8.7")
  end

end
