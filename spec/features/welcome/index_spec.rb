require 'rails_helper'

# When a user visits the root path they should be on the landing page ('/') which includes:

#  Title of Application
#  Button to Create a New User
#  List of Existing Users which links to the users dashboard
#  Link to go back to the landing page (this link will be present at the top of all pages)

RSpec.describe 'Landing page' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')
    @billy = User.create!(name: 'Billy GOAT', email: 'billygoat@billy.com')

    visit '/'
  end

  it 'should have the title of the application' do
    expect(page).to have_content('Viewing Party')
  end

  it 'should have a button to create a new user' do
    expect(page).to have_button("Create a New User")
  end

  it "should have a list of existing users which links to the user's dashboard" do
    expect(page).to have_content("#{@nate.email}'s Dashboard")
    expect(page).to have_content("#{@billy.email}'s Dashboard")
  end

  it "should have a link to go back to the landing page" do
    click_link 'Home'

    expect(current_path).to eql('/')
  end
end