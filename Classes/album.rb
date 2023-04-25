# rubocop:disable Metrics/ParameterLists
require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, genre, author_first_name, author_last_name, source, label_title, label_color, published_date,
                 on_spotify)
    super(id, genre, author_first_name, author_last_name, source, label_title, label_color, published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
# rubocop:enable Metrics/ParameterLists
