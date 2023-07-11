class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_reader :id, :archived

  def initialize(date, archived: false)
    @id = rand(1..1000)
    @publish_date = date
    @archived = archived
    @genre = []
    @author = []
    @source = []
    @label = []
  end

  private

  def can_be_archived?
    return true if @publish_date > 10 * 365

    false
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
