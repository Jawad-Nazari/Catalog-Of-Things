require_relative 'game_class'
require_relative 'author_class'
require_relative './game_json'
require 'date'

module GameHandler
  include HandleJsons

  def initialize
    @items = []
    load_games_from_json
  end

  def list_all_games
    puts "List of games:\n"
    Game.display_games(@items)
  end

  def list_all_authors
    puts 'List of authors:'
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
    save_games_to_json  # Save the game data to JSON

  end

  def save_data
    save_games_to_json
  end
end
