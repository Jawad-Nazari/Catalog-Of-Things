require 'json'
require_relative 'list_all_labels'

module LabelHandler
  def list_all_labels
    if File.exist?('store/labels.json') && !File.empty?('store/labels.json')
      stored_label = JSON.parse(File.read('store/labels.json'), symbolize_names: true)
      labels = stored_label
    end
    ListLabel.new.list_all_labels(labels)
  end
end
