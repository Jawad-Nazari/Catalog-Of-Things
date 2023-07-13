require_relative 'music'
require_relative 'genre'

module HandleAlbum
  # The above function initializes an empty array called @items.
  def initialize
    @items = []
  end

  # The function "list_all_music_albums" calls a method from the
  # MusicAlbum class to list all music albums.
  def list_all_music_albums
    MusicAlbum.list_all_music_albums(@items)
  end

  # The function `add_music_album` prompts the user to enter information
  # about a music album and creates a new instance of the `MusicAlbum`
  # class with the provided information.
  def add_music_album
    puts 'Enter the artist name:'
    artist = gets.chomp
    puts ''
    puts 'Enter album title:'
    title = gets.chomp
    puts ''
    puts 'Enter the genre:'
    genre = gets.chomp
    puts ''
    puts 'Is the album available on Spotify? (true/false):'
    on_spotify = gets.chomp.downcase == 'true'
    puts ''
    puts 'Enter the publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts ''

    album = MusicAlbum.add_music_album(artist, title, genre, publish_date, on_spotify)
    @items << album
    save_album_to_json
  end

  # The function "list_all_genre" calls a method "list_all_genres" from
  # the MusicAlbum class to list all genres of music albums.
  def list_all_genre
    MusicAlbum.list_all_genres(@items)
  end
end
