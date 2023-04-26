require 'json'
require_relative './storage'
require_relative '../Classes/genre'

class GenreStorage < Storage
  @genres = []

  class << self
    attr_accessor :genres
  end

  def self.fetch
    genres = if File.exist?('./data/genres.json') && File.size('./data/genres.json').positive?
               JSON.parse(File.read('./data/genres.json'))
             else
               []
             end
    deserialize(genres)
  end

  def self.save(genres)
    genres.each do |genre|
      GenreStorage.genres.push(serialize(genre))
    end
    File.write('./data/genres.json', JSON.pretty_generate(GenreStorage.genres))
  end

  def self.serialize(genre)
    {
      id: genre.id,
      name: genre.name,
      items: genre.items
    }
  end

  def self.deserialize(genres)
    temp = []
    genres.each do |genre|
      new_genre = Genre.new(genre['id'], genre['name'])
      temp.push(new_genre)
    end
    temp
  end
end
