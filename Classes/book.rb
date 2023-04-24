require_relative 'item'
class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(id,genre,author_first_name, author_last_name, source,label_title,label_color,cover_state, publisher)
    super(id,genre,author_first_name, author_last_name, source,label_title,label_color)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    return true if @cover_state == 'bad' || super().can_be_archived?
  end
end
