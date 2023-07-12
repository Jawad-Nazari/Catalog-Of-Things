require_relative '../label_utilities/list_all_labels'
require_relative '../label'

describe ListLabel do
  let(:label) { [{ id: 818, title: 'Who moved my cheeses', color: 'black' }] }
  let(:list_label) { ListLabel.new }

  it '.#list_all_labels should list all labels' do
    expect { list_label.list_all_labels(label) }.to output("Title: Who moved my cheeses, Color: black\n").to_stdout
  end
end
