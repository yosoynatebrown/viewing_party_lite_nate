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

        click_button 'Register'

        expect(current_path).not_to eql('/register')

        expect(page).to have_content("Martin's Dashboard")
        expect(page).to have_content("Viewing Parties")
      end
    end
    context 'when no information entered' do
      xit 'should display errors' do
        click_button 'Create Bulk discount'

        expect(page).to have_content("Error: Name can't be blank, Percent discount can't be blank, Quantity threshold can't be blank")
      end
    end
  end
end
