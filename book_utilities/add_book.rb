require_relative '../book'
require_relative '../label'
require_relative '../label_utilities/add_label'
require_relative '../requester/input_requester'
require_relative '../validater/input_validator'
require 'json'

class AddBook
  attr_accessor :book

  def initialize
    @book = []
  end

  def add_book()
    iq = InputRequester.new
    iv = InputValidator.new
    title = iv.validate_input(iq.request_input_with_message('Enter the title of the book: ', 'string'))
    color = iv.validate_input(iq.request_input_with_message('Enter the color of the label: ', 'string'))
    publish_date = iv.validate_input(iq.request_input_with_message('Enter the publish date of the book: ', 'date'))
    publisher = iv.validate_input(iq.request_input_with_message('Enter the publisher of the book: ', 'string'))
    cover_state = iv.validate_input(iq.request_input_with_message('Enter the cover state of the book: ', 'string'))
    new_book_item = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @book.push(new_book_item)
    add_books(@book, label)
    store_book(@book)
    store_label(label)
    puts 'Book added'
  end

  def store_book(new_book_item)
    obj = {
      id: new_book_item[0].id,
      publisher: new_book_item[0].publisher,
      publish_date: new_book_item[0].publish_date,
      cover_state: new_book_item[0].cover_state
    }

    stored_book = if File.exist?('store/books.json') && !File.empty?('store/books.json')
                    JSON.parse(File.read('store/books.json'))
                  else
                    []
                  end

    stored_book << obj
    File.write('store/books.json', stored_book.to_json)
  end

  def store_label(label)
    obj = {
      id: label.id,
      title: label.title,
      color: label.color
    }

    stored_label = if File.exist?('store/labels.json') && !File.empty?('store/labels.json')
                     JSON.parse(File.read('store/labels.json'))
                   else
                     []
                   end

    stored_label << obj
    File.write('store/labels.json', stored_label.to_json)
  end

  def add_books(book, label)
    add_label = AddLabel.new
    @book << book
    add_label.add_label(label)
  end
end
