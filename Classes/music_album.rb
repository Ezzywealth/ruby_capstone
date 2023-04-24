require_relative 'Classes/item'

class MusicAlbum < Item
  def initialize(on_spotify)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true unless (@on_spotify = true)

    false
  end
end