require_relative '../book_utilities/list_all_books'
require_relative '../book'

describe ListBook do
  let(:book) { [{ id: 219, publisher: 'Elham Basir', publish_date: '2011-09-09', cover_state: 'bad' }] }
  let(:list_book) { ListBook.new }

  it '.#list_all_books should list all books' do
    expect do
      list_book.list_all_books(book)
    end.to output("Publish date: 2011-09-09, Publisher: Elham Basir, Cover state: bad\n").to_stdout
  end
end
