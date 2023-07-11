require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify: true)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
