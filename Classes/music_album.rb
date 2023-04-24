require_relative 'Classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, publish_date, archived, on_spotify)
    super(id, publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
