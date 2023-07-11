require_relative '../book_utilities/list_all_books'
require_relative '../book_utilities/add_book'
require_relative '../book'

describe ListBook do
  let(:publisher) { 'Elham' }
  let(:cover_state) { 'bad' }
  let(:publish_date) { '2019-01-01' }
  let(:book) { Book.new(publish_date, publisher, cover_state) }
  let(:list_book) { ListBook.new }
  let(:add_book) { AddBook.new }

  it '.#list_all_books should list all books' do
    list_book.books << book
    expect do
      list_book.list_all_books
    end.to output("Publish date: #{publish_date}, Publisher: #{publisher}, Cover state: #{cover_state}\n").to_stdout
  end
end
