class ListLabel
  def list_all_labels(data)
    # Check if the data is empty or nil
    if [[], nil].include?(data)
      puts 'The labels is empty.'
    else
      data.each do |label|
        # Check if the data is a hash
        label = label = Label.new(label[:title], label[:color]) if label.is_a?(Hash)
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
