require 'json'
require_relative './storage'
require_relative '../Classes/book.rb'


class BookStorage < Storage
  @books = []

  class << self
    attr_accessor :books
  end

  def self.fetch
    books = if File.exist?('./data/books.json')
              JSON.parse(File.read('./data/books.json'))
            else
              []
            end
    deserialize(books)
  end

  def self.save(books)
    books.each do |book|
      BookStorage.books.push(serialize(book))
    end
    File.write('./data/books.json', JSON.pretty_generate(BookStorage.books))
  end

  def self.serialize(book)
    {
      author: book.author,
      id: book.id,
      genre: book.genre.id,
      source: book.source,
      label: book.label.id,
      published_date: book.published_date,
      archived: book.archived,
      cover_state: book.cover_state,
      publisher: book.publisher
    }
  end

  def self.deserialize(books)
    temp = []
    books.each do |book|
      new_book = Book.new(book['id'],book['genre'],book['author'],book['source'],book['label'],book['cover_state'],book['publisher'],book['published_date'])
      temp.push(new_book)
    end
    temp
  end
end
