require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')

    visit "/users/#{@nate.id}"
  end

  it "has user's name" do
    expect(page).to have_content("#{@nate.name}'s Dashboard")
  end

  it "has a 'Discover Movies' button" do
    expect(page).to have_button("Discover Movies")
  end

  xit 'has a section that lists viewing parties' do
  
  end
end