require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source, :label, :generated_id,

  def initialize(id, archived)
    @publish_date = Date.today
    @archived = archived
    @generated_id = []
    @id = generate_unique_number
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
