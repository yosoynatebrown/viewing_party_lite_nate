require 'rails_helper'

RSpec.describe "register user page", type: :view do
  before(:each) do
    visit "/register"
  end
  describe 'register user form' do
    context 'when valid information entered' do
      it 'should create a new user' do
        fill_in 'Name', with: "Martin Scorsese"
        fill_in 'Email', with: 'goodfellas123@movies.com'
        fill_in 'Password', with: 'password123'
        fill_in 'Password confirmation', with: 'password123'

        click_button 'Register'

        expect(current_path).not_to eql('/register')

        fill_in 'Email', with: 'goodfellas123@movies.com'
        fill_in 'Password', with: 'password123'
        click_button 'Log In'

        expect(page).to have_content("Martin Scorsese's Dashboard")
        expect(page).to have_content("Viewing Parties")
      end
    end
    context 'when no information entered' do
      it 'should display errors' do
        click_button 'Register'

        expect(current_path).to eql('/register')

        expect(page).to have_content("Error: Name can't be blank, Email can't be blank, Password digest can't be blank, Password can't be blank")
      end
    end

    context 'when non-matching passwords entered' do
      it 'should display errors' do
        fill_in 'Name', with: "Martin Scorsese"
        fill_in 'Email', with: 'goodfellas123@movies.com'
        fill_in 'Password', with: 'password123'
        fill_in 'Password confirmation', with: 'password456'

        click_button 'Register'

        expect(current_path).to eql('/register')

        expect(page).to have_content("Error: Password confirmation doesn't match")
      end
    end
  end
end
