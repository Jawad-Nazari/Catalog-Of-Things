require_relative 'music/handle_album'

class App
  include HandleAlbum

  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_music_albums,
    3 => :list_all_movies,
    4 => :list_all_games,
    5 => :list_all_genre,
    6 => :list_all_labels,
    7 => :list_all_authors,
    8 => :list_all_sources,
    9 => :add_book,
    10 => :add_music_album,
    11 => :add_movie,
    12 => :add_game
  }.freeze

  def run
    loop do
      display_menu
      option = gets.chomp.to_i
      process_option(option)
      break if option == 13
    end
  end

  def display_menu
    puts "Welcome to Catalog of Things App\n \n"
    puts "Choose an option by entering a number:\n \n"
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List of games'
    puts '5. List all genres'
    puts '6. List all labels '
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '13. Quit'
    puts ''
  end

  def process_option(option)
    if OPTIONS.key?(option)
      send(OPTIONS[option])
    else
      exit_app
    end
  end

  def exit_app
    puts "Thanks for using my app! I hope you enjoyed it... or at least didn't hate it.\n\n"
  end
end
