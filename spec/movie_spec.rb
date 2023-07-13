require_relative '../movie'

describe Movie do
  before(:each) do
    @movie = Movie.new('2019-1-17', silent: false, archived: false, name: 'Test')
  end

  it 'shows instance of Movie class' do
    expect(@movie).to be_instance_of(Movie)
  end

  it 'shows inheritance from Item class' do
    expect(@movie).to be_kind_of(Item)
  end

  it 'verifies archived returns false' do
    expect(@movie.archived).to be false
  end

  it 'verifies silent returns false' do
    expect(@movie.silent).to be false
  end
end
