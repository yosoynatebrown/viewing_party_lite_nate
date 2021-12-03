require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')

    visit "/users/#{@nate.id}/discover"
  end
  it 'can load the page' do
    expect(page).to have_content("Discover Page")
  end
end
