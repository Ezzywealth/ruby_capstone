require_relative 'Classes/item'

class Genre < Item
  attr_reader :id, :name, :items

  def initialize(id, name)
    super(id, publish_date, archived)
    @id = id
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.genre = self
  end
end
