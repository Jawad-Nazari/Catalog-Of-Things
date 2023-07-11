class ListBook
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    if @books == []
      puts 'The books is empty.'
    else
      @books.each do |book|
        puts "Publish date: #{book.publish_date}, " \
             "Publisher: #{book.publisher}, " \
             "Cover state: #{book.cover_state}"
      end
    end
  end
end
