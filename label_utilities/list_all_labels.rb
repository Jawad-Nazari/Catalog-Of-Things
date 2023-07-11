class ListLabel
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def list_all_labels
    if @labels == []
      puts 'The labels is empty.'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
