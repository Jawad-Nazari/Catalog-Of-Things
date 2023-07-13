require_relative 'app'

def main
  app1 = App.new
  app1.load_album_from_json
  app1.load_games_from_json
  app1.run
end

main
