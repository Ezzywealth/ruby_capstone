require 'json'
require_relative './storage'
require_relative '../Classes/book'
require_relative '../app'
require_relative './genre_storage'
require_relative './label_storage'
class BookStorage < Storage
  @books = []

  class << self
    attr_accessor :books
  end

  def self.fetch
    books = if File.exist?('./data/books.json') && File.size('./data/books.json').positive?
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
      genre = GenreStorage.fetch.find { |genr| genr.id == book['genre'] }
      label = LabelStorage.fetch.find { |labe| labe.id == book['label'] }
      # author = AuthorStorage.fetch.find { |auth| auth.id == book['author'] }

      new_book = Book.new(book['id'], genre, book['author'], book['source'], label, book['cover_state'],
                          book['publisher'], book['published_date'])
      temp.push(new_book)
    end
    temp
  end
end
