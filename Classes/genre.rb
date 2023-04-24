require_relative 'Classes/item'

class Genre < Item
  
  attr_reader :id, :name, :items

  def initialize(id, name, items = [])
    @id = id
    @name = name
    @items = items
  end

  def add_items(item)
    @items << item
  end
end


