require 'json'

module JsonHandler
  def load_album_from_json
    load_music_from_json
  end

  def save_album_to_json
    save_music_to_json
  end

  private

  # Loads books from JSON file
  def load_music_from_json
    if File.exist?('album.json')
      album_data = File.read('album.json')
      album_json = JSON.parse(album_data, symbolize_names: true)
      @items = album_json.map do |albums|
        MusicAlbum.new(
          artist: albums[:artist],
          title: albums[:title],
          genre: albums[:genre],
          publish_date: albums[:publish_date],
          on_spotify: albums[:on_spotify]
        )
      end
    else
      @items = []
    end
  end

  # Saves books to JSON file
  def save_music_to_json
    album_data = @items.map do |item|
      {
        artist: item.artist,
        title: item.title,
        genre: item.genre,
        publish_date: item.publish_date,
        on_spotify: item.on_spotify
      }
    end
    File.write('album.json', JSON.pretty_generate(album_data))
  end
end
