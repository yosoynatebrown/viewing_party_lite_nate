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

    visit "/users/#{@nate.id}"
  end

  it "has user's name" do
    expect(page).to have_content("#{@nate.name}'s Dashboard")
  end

  it "has a 'Discover Movies' button" do
    expect(page).to have_button("Discover Movies")
  end

  it 'has a section that lists viewing parties' do
    expect(page).to have_content("Viewing Parties")
    expect(page).to have_link("Fight Club")
    expect(page).to have_content(@billy.name)
    expect(page).to have_content(@jack.name)
    expect(page).not_to have_content(@lucy.name)
  end
end