require 'json'
require_relative './storage'
require_relative '../Classes/author'

class AuthorStorage < Storage
  @authors = []

  class << self
    attr_accessor :authors
  end

  def self.fetch
    authors = if File.exist?('./data/authors.json') && File.size('./data/authors.json').positive?
                JSON.parse(File.read('./data/authors.json'))
              else
                []
              end
    deserialize(authors)
  end

  def self.save(authors)
    authors.each do |author|
      AuthorStorage.authors.push(serialize(author))
    end
    File.write('./data/authors.json', JSON.pretty_generate(AuthorStorage.authors))
  end

  def self.serialize(author)
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      items: author.items
    }
  end

  def self.deserialize(authors)
    temp = []
    authors.each do |author|
      new_author = Author.new(author['id'], author['first_name'], author['last_name'])
      temp.push(new_author)
    end
    temp
  end
end
