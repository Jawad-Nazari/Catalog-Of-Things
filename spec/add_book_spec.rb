require_relative '../book_utilities/add_book'
require_relative '../label_utilities/add_label'
require_relative '../book'
describe AddBook do
  let(:publisher) { 'Elham' }
  let(:cover_state) { 'bad' }
  let(:publish_date) { '2019-01-01' }
  let(:book) { Book.new(publish_date, publisher, cover_state) }
  let(:label) { Label.new('title', 'color') }
  let(:add_book) { AddBook.new }
  let(:add_label) { AddLabel.new }

  it '.#add_book should add a book' do
    expect { add_book.add_books(book, label) }.to change { add_book.book.count }.by(1)
  end
end
