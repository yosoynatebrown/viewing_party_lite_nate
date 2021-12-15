require 'rails_helper'

RSpec.describe "Login user page", type: :view do
  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    
    visit "/login"
  end
  describe 'login user form' do
    context 'when valid information entered' do
      it 'should login a user' do
        fill_in 'Email', with: 'natedawg@nate.com'
        fill_in 'Password', with: 'thisispassword'

        click_button 'Log In'
        
        expect(page).to have_content("#{@nate.name}'s Dashboard")
        expect(page).to have_content("Viewing Parties")
      end
    end

    context 'when invalid information entered' do
      it 'should not login a user' do
        fill_in 'Email', with: 'natedawg@nate.com'
        fill_in 'Password', with: 'thisisnotmypassword'

        click_button 'Log In'

        expect(current_path).to eq("/login")
        expect(page).to have_content("Error: Authentication failed")
      end
    end
  end
end