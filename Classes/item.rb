require 'date'
require_relative './genre.rb'
require_relative './source.rb'
require_relative './label.rb'
require_relative './author.rb'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source, :label, :generated_id

  def initialize(id, genre,author_first_name, author_last_name, source,label_title,label_color)
    @publish_date = Date.today
    @archived = true
    @generated_id = []
    @id = id || generate_unique_number
    @genre = Genre.new(id,genre)
    @source = source
    @label = Label.new(id, label_title, label_color)
    @author = "#{author_first_name} #{author_last_name}"

  end

  def can_be_archived?
    return true unless @publish_date <= 10

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
