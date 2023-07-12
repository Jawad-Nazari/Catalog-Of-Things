require_relative '../item'

class MusicAlbum < Item
  # Creating getter and setter methods for the `on_spotify`, `artist`, and
  # `title` instance variables. This allows us to access and modify
  # these variables outside of the class.
  attr_accessor :on_spotify, :artist, :title

  # The above function is a Ruby constructor that initializes an object with
  # artist, title, genre, on_spotify, and publish_date attributes.
  def initialize(artist:, title:, genre:, on_spotify: true, publish_date:)
    super(publish_date)
    @artist = artist
    @title = title
    @on_spotify = on_spotify
    @genre = genre
  end

  # The method `can_be_archived?` returns `true` if the `super` method returns `true` and the
  # instance variable `@on_spotify` is truthy. Otherwise, it returns `false`.
  def can_be_archived?
    return true if super && @on_spotify

    false
  end

  # Is a class method that takes an array of `items` as a parameter.
  # It then iterates over each `album` in the `items` array and prints out
  # information about each album, including the album ID, artist name, title,
  # whether it is on Spotify, and the published date. Each album's information
  # is printed on a new line.
  def self.list_all_music_albums(items)
    puts 'All Music Albums:'
    items.each do |album|
      puts "Album ID: #{album.id}, Artist Name: #{album.artist}, Title: #{album.title}, "\
      "On Spotify: #{album.on_spotify}, Published Date: #{album.publish_date} \n"
      puts ''
    end
  end

  # The `def self.add_music_album` method is a class method that
  # creates a new instance of the `MusicAlbum` class with the given
  # parameters: `artist`, `title`, `genre`,`on_spotify`, and 'publish_date`.
  # It then prints a message indicating that a new album has been added with the ID of
  # the new album. Finally, it returns the newly created album instance.
  def self.add_music_album(artist, title, genre, on_spotify, publish_date)
    new_album = MusicAlbum.new(artist: artist, title: title, genre: genre, on_spotify: on_spotify,\
                               publish_date: publish_date)
    puts "New album added with ID: #{new_album.id} \n"
    puts ''
    new_album
  end

  # The `def self.list_all_genres(items)` method is a class
  # method that lists all the genres of music albums in the
  # given `items` array.
  def self.list_all_genres(items)
    puts "All Genre: \n"
    items.each do |genre|
      puts "Artist Name: #{genre.artist}, Genre: #{genre.genre} \n"
      puts ''
    end
  end
end
