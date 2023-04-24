class Item

  attr_accessor: :id, :publish_date, :archived

  def initialize(id,publish_date,archived)
    @id=id
    @publish_date=publish_date
    @archived=archived
  end

  def genre=(genre)
    @genre=genre
  end

  def author=(author)
    @author=author
  end

  def source = (source)
    @source=source
  end

  def label=(label)
    @label=label
  end

  def can_be_archived?
    return true unless @publish_date <= 10
    return false
  end

  def move_to_archive
    @archived=true if can_be_archived?
  end
end