require_relative '../requester/input_requester'
require_relative '../validater/input_validator'
require_relative '../book'
require_relative '../label'
require_relative '../label_utilities/add_label'
class AddBook
  attr_accessor :book

  def initialize
    @book = []
  end

  def add_book()
    iq = InputRequester.new
    iv = InputValidator.new
    AddLabel.new
    title = iv.validate_input?(iq.request_input_with_message('Enter the title of the book: ', 'string'))
    color = iv.validate_input?(iq.request_input_with_message('Enter the color of the label: ', 'string'))
    publish_date = iv.validate_input?(iq.request_input_with_message('Enter the publish date of the book: ', 'date'))
    publisher = iv.validate_input?(iq.request_input_with_message('Enter the publisher of the book: ', 'string'))
    cover_state = iv.validate_input?(iq.request_input_with_message('Enter the cover state of the book: ', 'string'))
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    add_books(book, label)
    puts 'Book added'
  end

  def add_books(book, label)
    add_label = AddLabel.new
    @book << book
    add_label.add_label(label)
  end
end
