require 'rails_helper'

RSpec.describe 'Landing page' do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @billy = User.create!(name: 'Billy GOAT', email: 'billygoat@billy.com', password: 'thisispassword', password_confirmation: 'thisispassword')

    visit root_path
  end

  it 'should have the title of the application' do
    expect(page).to have_content('Viewing Party')
  end

  it 'should have a button to create a new user' do
    expect(page).to have_button("Create a New User")
  end

  it "should have a list of existing users which links to the user's dashboard" do
    click_link 'Log In'

    fill_in 'Email', with: 'natedawg@nate.com'
    fill_in 'Password', with: 'thisispassword'

    click_button 'Log In'

    visit root_path

    expect(page).to have_content("#{@nate.email}")
    expect(page).to have_content("#{@billy.email}") 
  end

  it "should have a link to go back to the landing page" do
    click_link 'Home'

    expect(current_path).to eql('/')
  end

  it 'should have a login link if not logged in' do
    click_link 'Log In'

    expect(current_path).to eql('/login')
  end

  it 'should have a logout link if logged in' do
    expect(page).not_to have_link('Log Out')

    click_link 'Log In'

    fill_in 'Email', with: 'natedawg@nate.com'
    fill_in 'Password', with: 'thisispassword'

    click_button 'Log In'

    visit root_path

    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log In')
  end
    
  it 'should not have a list of users if visitor is not registered' do
    expect(page).not_to have_content("billygoat@billy.com")
    expect(page).not_to have_content("natedawg@nate.com")
  end

  it 'should redirect a visitor who attempts to use dashboard' do
    visit '/dashboard'

    expect(page).to have_content("You have to be logged in or registered to access the dashboard")
  end

end