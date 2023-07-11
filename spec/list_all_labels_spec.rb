require_relative '../label_utilities/list_all_labels'
require_relative '../label_utilities/add_label'
require_relative '../book_utilities/add_book'
require_relative '../label'
require_relative '../book'

describe ListLabel do
  let(:publisher) { 'Elham' }
  let(:cover_state) { 'bad' }
  let(:publish_date) { '2019-01-01' }
  let(:book) { Book.new(publish_date, publisher, cover_state) }
  let(:label) { Label.new('title', 'color') }
  let(:add_book) { AddBook.new }
  let(:add_label) { AddLabel.new }
  let(:list_label) { ListLabel.new }

  it '.#list_all_labels should list all labels' do
    list_label.labels << label
    expect { list_label.list_all_labels }.to output("Title: #{label.title}, Color: #{label.color}\n").to_stdout
  end
end
