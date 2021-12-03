require 'rails_helper'

RSpec.describe Review do
  let(:review) { Review.new(550, review_data) }

  it 'has attributes' do

    expect(review.movie_id).to eq(550)
    expect(review.author).to eq("Goddard")
    expect(review.text).to be_a String
  end

end