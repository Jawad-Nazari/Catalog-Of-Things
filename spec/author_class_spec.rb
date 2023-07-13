# author_class_spec.rb
require_relative '../author_class'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the author\'s items' do
      author = Author.new('John', 'Doe')
      item = Item.new(Time.now) # Passes the publish date argument to the Item constructor
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the author of the added item' do
      author = Author.new('John', 'Doe')
      item = Item.new(Time.now) # Passes the publish date argument to the Item constructor
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
