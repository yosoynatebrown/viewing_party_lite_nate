require 'rails_helper'

# Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party

RSpec.describe 'New Viewing Party Page' do
  let(:data) { {
    id: 550,
  } }

  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @billy = User.create!(name: 'Billy', email: 'billy@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @jack = User.create!(name: 'Jack', email: 'jack@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')
    @lucy = User.create!(name: 'Lucy', email: 'lucy@nate.com', password: 'thisispassword', password_confirmation: 'thisispassword')

    @movie = Movie.new(data)

    visit "/login"

    fill_in 'Email', with: 'natedawg@nate.com'
    fill_in 'Password', with: 'thisispassword'

    click_button 'Log In'
    
    visit "/dashboard/movies/#{@movie.id}/viewing_parties/new"
  end

  it 'has the duration of party with default of movie runtime' do
    expect(page).to have_field('length', with: '139')
  end
context 'when valid info entered' do 
  it 'has a working form to create viewing parties' do
    fill_in 'length', with: '140'

    select('2019', from: '_date_1i')
    select('June', from: '_date_2i')
    select('12', from: '_date_3i')

    select('07 AM', from: '_start_time_4i')
    select('30', from: '_start_time_5i')

    expect(page).to have_select('_date_1i', selected: '2019')
    expect(page).to have_select('_date_2i', selected: 'June')
    expect(page).to have_select('_date_3i', selected: '12')

    expect(page).to have_select('_start_time_4i', selected: '07 AM')
    expect(page).to have_select('_start_time_5i', selected: '30')

    within "#user-#{@jack.id}" do
      check
    end
    within "#user-#{@lucy.id}" do
      check
    end

    click_button 'Create Viewing Party'

    expect(current_path).to eql("/dashboard")
  end
context 'when invalid length entered' do 
  it 'errors out' do
    fill_in 'length', with: '100'

    select('2019', from: '_date_1i')
    select('June', from: '_date_2i')
    select('12', from: '_date_3i')

    select('07 AM', from: '_start_time_4i')
    select('30', from: '_start_time_5i')

    expect(page).to have_select('_date_1i', selected: '2019')
    expect(page).to have_select('_date_2i', selected: 'June')
    expect(page).to have_select('_date_3i', selected: '12')

    expect(page).to have_select('_start_time_4i', selected: '07 AM')
    expect(page).to have_select('_start_time_5i', selected: '30')

    within "#user-#{@jack.id}" do
      check
    end
    within "#user-#{@lucy.id}" do
      check
    end

    click_button 'Create Viewing Party'

    expect(current_path).to eql("/dashboard/movies/#{@movie.id}/viewing_parties/new")
    expect(page).to have_content("Error: Something went wrong. Check that your party duration is not shorter than your movie runtime")
  end
end
end
end
