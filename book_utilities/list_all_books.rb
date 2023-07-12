class ListBook
  def list_all_books(data)
    if [[], nil].include?(data)
      puts 'The books is empty.'
    else
      data.each do |book|
        book = Book.new(book[:publish_date], book[:publisher], book[:cover_state]) if book.is_a?(Hash)
        puts "Publish date: #{book.publish_date}, " \
             "Publisher: #{book.publisher}, " \
             "Cover state: #{book.cover_state}"
      end
    end
  end
end
