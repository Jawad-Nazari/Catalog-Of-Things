require_relative '../game/author_class'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the author\'s items' do
      author = Author.new('John', 'Doe')
      item = Item.new(Time.now)
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the author of the added item' do
      author = Author.new('John', 'Doe')
      item = Item.new(Time.now)
      author.add_item(item)
      expect(item.instance_variable_get(:@author)).to eq(author)
    end
  end
end
