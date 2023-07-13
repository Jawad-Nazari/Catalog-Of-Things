require 'fileutils'
require 'json'

module GameJsons
  GAME_JSON = 'JSON'.freeze
  GAMES_FILE = File.join(GAME_JSON, 'games.json').freeze

  def save_games_to_json
    FileUtils.mkdir_p(GAME_JSON)

    games_data = @items.map do |game|
      {
        'title' => game.title,
        'author_name' => game.author_name,
        'multiplayer' => game.multiplayer,
        'last_played_at' => game.last_played_at.to_s
      }
    end

    File.write(GAMES_FILE, JSON.pretty_generate(games_data))
    puts "Games data saved to #{GAMES_FILE}."
  end

  def load_games_from_json
    return unless File.exist?(GAMES_FILE)

    @items = []

    games_data = JSON.parse(File.read(GAMES_FILE))
    games_data.each do |game_data|
      title = game_data['title']
      author_name = game_data['author_name']
      multiplayer = game_data['multiplayer']
      last_played_at = Date.parse(game_data['last_played_at'])

      game = Game.new(multiplayer, last_played_at, author_name, title)
      @items << game
    end

    puts "Games data loaded from #{GAMES_FILE}."
  end
end
