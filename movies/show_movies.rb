module ShowMovies
  def list_all_movies
    load_movies_from_json
    if @list_all_movies.nil? || @list_all_movies.empty?
      puts 'No movies found. Please add a movie.'
    else
      @list_all_movies.each do |movie|
        puts "Title: \"#{movie['title']}\", Silent: #{movie['silent']}, Date: #{movie['publish_date']}"
      end
    end
  end
end
