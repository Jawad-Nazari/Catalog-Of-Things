require_relative 'game_class'
require_relative 'author_class'
require_relative 'game_json'
require 'date'

module GameHandler
  include GameJsons
  def initialize
    @item = []
  end

  def list_all_games
    puts "List of games:\n"
    Game.display_games(@item)
  end

  def list_all_authors
    puts 'List of authors:'
    Game.list_all_authors(@item)
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

    @item << game

    puts "Game added successfully!\n"
    save_games_to_json # Save the game data to JSON
  end
end
