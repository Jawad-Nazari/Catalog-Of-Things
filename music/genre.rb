# The Genre class represents a genre and has a name and a
# collection of items.
class Genre
  attr_accessor :name, :items

  def initialize(name = 'Unknown')
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  # The add_item function adds an item to an array called items.
  def add_item(item)
    items << item
  end
end
