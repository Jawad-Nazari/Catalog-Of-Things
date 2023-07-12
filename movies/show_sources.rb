module ShowSources
  def list_all_sources
    load_sources_from_json
    if @list_all_sources.nil? || @list_all_sources.empty?
      puts 'Please add a movie.'
    else
      @list_all_sources.each do |source|
        puts "Source: \"#{source['source']}\""
      end
    end
  end
end
