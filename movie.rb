require_relative 'item'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(publish_date, silent: false, archived: false, name: 'unknown')
    super(publish_date, archived: archived)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super() || @silent
  end
  private :can_be_archived?
end
