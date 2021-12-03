require 'rails_helper'

# Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party

RSpec.describe 'New Viewing Party Page' do
  let(:data) { {
    id: 1,
    title: 'The Matrix',
    vote_average: 7.7,
    vote_count: 100,
    summary: 'A guy named Neo does stuff',
    length: 120
  } }

  before(:each) do
    @nate = User.create!(name: 'Nate Dawg', email: 'natedawg@nate.com')
    @billy = User.create!(name: 'Billy', email: 'billy@nate.com')
    @jack = User.create!(name: 'Jack', email: 'jack@nate.com')
    @lucy = User.create!(name: 'Lucy', email: 'lucy@nate.com')

    @movie = Movie.new(data)
    
    visit "/users/#{@nate.id}/movies/#{@movie.id}/viewing_parties/new"
  end

  xit 'has the duration of party with default of movie runtime' do
    expect(page).to have_field('length', with: '120')
  end

  it 'has a working field to select date' do
    fill_in 'length', with: '125'

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

    save_and_open_page
    within "#user-#{@jack.id}" do
      check
    end
    within "#user-#{@lucy.id}" do
      check
    end

    click_button 'Create Viewing Party'

    expect(current_path).to eql("/users/#{@nate.id}/")
  end
end
