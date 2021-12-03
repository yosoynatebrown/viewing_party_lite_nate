require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')
    @billy = User.create!(name: 'Billy', email: 'billy@nate.com')
    @jack = User.create!(name: 'Jack', email: 'jack@nate.com')
    @lucy = User.create!(name: 'Lucy', email: 'lucy@nate.com')

    visit "/users/#{@nate.id}"
  end

  it "has user's name" do
    expect(page).to have_content("#{@nate.name}'s Dashboard")
  end

  it "has a 'Discover Movies' button" do
    expect(page).to have_button("Discover Movies")
  end

  it 'has a section that lists viewing parties' do
    
  end
end