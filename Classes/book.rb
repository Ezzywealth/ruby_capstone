class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(id, publish_date, archived, cover_state, publisher)
    super(id, publish_date, archived)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    return true if @cover_state == 'bad' || super().can_be_archived?
  end
end
