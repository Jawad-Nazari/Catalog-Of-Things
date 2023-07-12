require '../source'
require_relative 'item'
require 'rspec'

RSpec.describe Source do
  subject(:source) { Source.new('Drama') }

  it 'shows instance of Source class' do
    expect(subject).to be_instance_of(Source)
  end

  it 'should return an empty array' do
    expect(subject.items).to be_empty
  end

  it 'should add the item to add_item method and set the source attribute' do
    item = Item.new(name: 'name', publish_date: '2019-1-17', archived: true)
    source.add_item(item)

    expect(source.items).to include(item)
    expect(item.source).to eql(source)
  end
end
