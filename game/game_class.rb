require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author_name, :title

  def initialize(multiplayer, last_played_at, author_name, title)
    super(multiplayer)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author_name = author_name
    @title = title
  end

  def can_be_archived?
    two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
    return true if super && @last_played_at < two_years_ago

    false
  end

  def self.display_games(items)
    items.each do |game|
      puts "Game title: #{game.title}\n"
      puts ''
      puts "Author Name: #{game.author_name} \n"
      puts ''
      puts "Multiplayer: #{game.multiplayer} \n"
      puts ''
      puts "Last played date: #{game.last_played_at}\n"
      puts ''
    end
  end

  def self.list_all_authors(items)
    items.each do |author|
      puts "Author Name: #{author.author_name} \n"
      puts ''
    end
  end
end
