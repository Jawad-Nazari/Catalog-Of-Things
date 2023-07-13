require 'fileutils'

module HandleJsons
  JSON_FOLDER = 'JSON'.freeze
  MOVIES_FILE = File.join(JSON_FOLDER, 'movies.json').freeze
  SOURCES_FILE = File.join(JSON_FOLDER, 'sources.json').freeze

  def save_movies_to_json
    FileUtils.mkdir_p(JSON_FOLDER)

    File.write(MOVIES_FILE, JSON.pretty_generate(@list_all_movies))
    puts "Movies data saved to #{MOVIES_FILE}."
  end

  def save_sources_to_json
    FileUtils.mkdir_p(JSON_FOLDER)

    File.write(SOURCES_FILE, JSON.pretty_generate(@list_all_sources))
    puts "Sources data saved to #{SOURCES_FILE}."
  end

  def load_movies_from_json
    return unless File.exist?(MOVIES_FILE)

    @list_all_movies = []

    movies_data = JSON.parse(File.read(MOVIES_FILE))
    movies_data.each do |movie|
      @list_all_movies << {
        'id' => movie['id'],
        'publish_date' => movie['publish_date'],
        'silent' => movie['silent'],
        'title' => movie['title'],
        'source' => movie['source']
      }
    end

    puts "Movies data loaded from #{MOVIES_FILE}."
  end

  def load_sources_from_json
    return unless File.exist?(SOURCES_FILE)

    @list_all_sources ||= []

    sources_data = JSON.parse(File.read(SOURCES_FILE))
    sources_data.each do |source|
      @list_all_sources << {
        'source' => source['source']
      }
    end

    puts "Sources data loaded from #{SOURCES_FILE}."
  end
end
