# rubocop:disable Metrics/ParameterLists

require 'time'
require_relative './genre'
require_relative './label'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source, :label, :generated_id

  def initialize(id, genre, author_first_name, author_last_name, source, label_title, label_color, published_date)
    @published_date = published_date
    @archived = true
    @generated_id = []
    @id = id || generate_unique_number
    @genre = Genre.new(id, genre)
    @source = source
    @label = Label.new(id, label_title, label_color)
    @author = "#{author_first_name} #{author_last_name}"
  end

  def can_be_archived?
    date = Time.parse(@published_date)
    return true if ((Time.now - date) / 60 / 60 / 24 / 365).to_i > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
  end

  def generate_unique_number
    number = rand(1..1000)
    number = rand(1..1000) while @generated_id.include?(number)
    @generated_id << number
    number
  end
end
# rubocop:enable Metrics/ParameterLists
