require_relative 'app'

def main
  app1 = App.new
  app1.load_album_from_json
  app1.run
  app1.save_album_to_json
end

main
