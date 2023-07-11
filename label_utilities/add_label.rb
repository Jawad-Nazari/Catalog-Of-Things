class AddLabel
  attr_accessor :label

  def initialize
    @label = []
  end

  def add_label(label)
    @label << label
  end
end
