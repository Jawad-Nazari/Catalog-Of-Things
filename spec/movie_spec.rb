require '../movie'
require 'rspec'

RSpec.describe Movie do
  subject(:movie) { Movie.new(publish_date: Time.parse('2021-05-07'), silent: false, archived: false, name: 'Test') }

  it 'shows an instance of the Movie class' do
    expect(movie).to be_an_instance_of(Movie)
  end

  it 'shows inheritance from the Item class' do
    expect(movie).to be_a(Item)
  end

  it 'verifies archived returns false' do
    expect(movie.archived).to be(false)
  end

  it 'verifies silent returns false' do
    expect(movie.silent).to be(false)
  end
end
