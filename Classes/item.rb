class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true unless @publish_date <= 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
