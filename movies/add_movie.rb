require_relative '../movie'
require_relative '../label'
require_relative '../source'
require_relative 'handle_jsons'

module AddMovie
  include HandleJsons

  def add_movie
    print 'Enter movie title: '
    input_title = gets.chomp
    print 'Date of published: '
    input_date = gets.chomp
    print 'Is the movie silent?[Y/N]: '
    input_silent = gets.chomp
    input_silent = %w[y Y].include?(input_silent)
    print "Where did you get it? (example, 'from a friend', 'Online shop' or ....): "
    input_source = gets.chomp
    print 'Movie added successfully! '

    create_movie(input_title, input_date, input_silent, input_source)
    save_movies_to_json
    save_sources_to_json
  end

  def create_movie(title, date, silent, source)
    movie = Movie.new(date, silent: silent)
    label = Label.new(title, 'color')
    source = Source.new(source)

    add_movie_to_list(movie, label, source)
  end

  def add_movie_to_list(movie, label, source)
    add_movie_to_movies_list(movie, label, source)
    add_movie_to_labels_list(label)
    add_movie_to_sources_list(source)
  end

  def add_movie_to_movies_list(movie, label, source)
    @list_all_movies ||= []
    @list_all_movies.push(
      {
        'id' => movie.id,
        'publish_date' => movie.publish_date,
        'silent' => movie.silent,
        'title' => label.title,
        'source' => source.name
      }
    )
  end

  def add_movie_to_labels_list(label)
    @list_all_labels ||= []
    @list_all_labels.push(
      {
        'title' => label.title
      }
    )
  end

  def add_movie_to_sources_list(source)
    @list_all_sources ||= []
    @list_all_sources.push(
      {
        'source' => source.name
      }
    )
  end

  def list_all_sources
    @list_all_sources ||= []
    if @list_all_sources.empty?
      puts 'Please add a movie.'
    else
      @list_all_sources.each do |source|
        puts "Source: \"#{source['source']}\""
      end
    end
  end
end
