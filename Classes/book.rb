# rubocop:disable Metrics/ParameterLists
# rubocop:disable Metrics/LineLength
require_relative 'item'
class Book < Item
  attr_accessor :cover_state, :publisher, :published_date

  def initialize(id, genre, author_first_name, author_last_name, source, label_title, label_color, cover_state, publisher,
                 published_date)
    super(id, genre, author_first_name, author_last_name, source, label_title, label_color, published_date)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    return true if @cover_state == 'bad'
    return super if defined?(super)

    false
  end
end
# rubocop:enable Metrics/ParameterLists
# rubocop:enable Metrics/LineLength
