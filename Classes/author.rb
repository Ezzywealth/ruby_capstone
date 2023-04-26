require 'securerandom'

class Author
  attr_accessor :items, :first_name, :last_name, :id

  def initialize(id, first_name, last_name)
    @id = id || rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
