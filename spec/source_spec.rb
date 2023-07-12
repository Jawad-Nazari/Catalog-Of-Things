require_relative '../source'
require_relative '../item'

describe Source do
  before(:each) do
    @source = Source.new('Drama')
  end

  it 'shows instance of Source class' do
    expect(@source).to be_instance_of(Source)
  end

  it 'should return an empty array' do
    expect(@source.items).to eq([])
  end

  it 'should add the item to add_item method' do
    item = Item.new('2015-10-10', archived: true)
    @source.add_item(item)
    expect(@source.items).to include(item)
  end

  it 'should set the source of the item when added' do
    item = Item.new('2019-01-17', archived: true)
    @source.add_item(item)
    expect(item.source).to eq(@source)
  end
end
