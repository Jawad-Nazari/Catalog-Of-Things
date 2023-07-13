require 'json'
require_relative 'list_all_books'
require_relative 'add_book'
module BookHandler
  def list_all_books
    if File.exist?('store/books.json') && !File.empty?('store/books.json')
      stored_book = JSON.parse(File.read('store/books.json'), symbolize_names: true)
      books = stored_book
    end
    ListBook.new.list_all_books(books)
  end

  def add_book
    AddBook.new.add_book
  end
end
