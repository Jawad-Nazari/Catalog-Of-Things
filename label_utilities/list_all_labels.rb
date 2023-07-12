class ListLabel
  def list_all_labels(data)
    if [[], nil].include?(data)
      puts 'The labels is empty.'
    else
      data.each do |label|
        label = label = Label.new(label[:title], label[:color]) if label.is_a?(Hash)
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
