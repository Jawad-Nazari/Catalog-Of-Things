class AddLabel
  attr_accessor :label

  # This method is used to initialize the label array.
  def initialize
    @label = []
  end

  # This method is used to add a label to the label array.
  def add_label(label)
    @label << label
  end
end
