require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(multiplayer)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
    return true if super && @last_played_at < two_years_ago

    false
  end
end
