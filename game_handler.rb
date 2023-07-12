require_relative 'game_class'
require_relative 'author_class'
require 'date'

module GameHandler
  def initialize
    @items = []
  end

  def list_all_games
    puts "List of games:\n"
    Game.display_games(@items)
  end

  def list_all_authors
    puts "List of authors:"
    Game.list_all_authors(@items)
  end

  def add_game
    puts 'Enter game name:'
    title = gets.chomp
    puts ''
    puts 'Enter Author name:'
    author_name = gets.chomp
    puts ''
    print "Multiplayer (true/false): \n"
    multiplayer = gets.chomp.downcase == 'true'
    print "Last played date (YYYY-MM-DD): \n"
    last_played_at = Date.parse(gets.chomp)

    game = Game.new(multiplayer, last_played_at, author_name, title)    

    @items << game

    puts "Game added successfully!\n"
  end

  private

end
