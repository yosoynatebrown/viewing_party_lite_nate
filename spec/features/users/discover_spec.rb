require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')

    visit "/login"

    fill_in 'Email', with: 'natedawg@nate.com'
    fill_in 'Password', with: 'thisispassword'

    click_button 'Log In'

    visit "/dashboard/discover"
  end
  it 'can load the page' do
    expect(page).to have_content("Discover Page")
  end
end
