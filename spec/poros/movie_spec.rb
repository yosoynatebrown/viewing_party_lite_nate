require 'rails_helper'

RSpec.describe Movie do
  let(:movie) { Movie.new(movie_data) }

  it 'has attributes' do

    expect(movie.id).to eq(550)
    expect(movie.title).to eq('Fight Club')
    expect(movie.vote_average).to eq(8.4)
    expect(movie.vote_count).to eq(22944)
    expect(movie.summary).to be_a String
    expect(movie.genres).to eq([])
    expect(movie.cast).to eq([])
    expect(movie.length).to eq(0)
    expect(movie.poster_path).to eq('')
  end

  it '#add_details' do
    movie.add_details(movie_data)

    expect(movie.genres).to eq(["Drama"])
    expect(movie.length).to eq(139)
    expect(movie.poster_path).to eq("/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
  end

  it '#length_hours' do
    movie.add_details(movie_data)

    expect(movie.length_hours).to eq("2:19")
  end

  it '#add_cast' do
    movie.add_cast(cast_data)

    expect(movie.cast).to eq(["Edward Norton", "Brad Pitt", "Helena Bonham Carter", "Meat Loaf"])
  end
end