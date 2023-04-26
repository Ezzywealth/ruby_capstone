require 'json'
require_relative './storage'
require_relative '../Classes/album'
require_relative '../app'
require_relative './genre_storage'
require_relative './label_storage'

class AlbumStorage < Storage
  @albums = []

  class << self
    attr_accessor :albums
  end

  def self.fetch
    albums = if File.exist?('./data/albums.json') && File.size('./data/albums.json').positive?
               JSON.parse(File.read('./data/albums.json'))
             else
               []
             end
    deserialize(albums)
  end

  def self.save(albums)
    albums.each do |album|
      AlbumStorage.albums.push(serialize(album))
    end
    File.write('./data/albums.json', JSON.pretty_generate(AlbumStorage.albums))
  end

  def self.serialize(album)
    {
      author: album.author,
      id: album.id,
      genre: album.genre.id,
      source: album.source,
      label: album.label.id,
      # published_date: album.published_date,
      archived: album.archived,
      on_spotify: album.on_spotify
    }
  end

  def self.deserialize(albums)
    temp = []
    albums.each do |album|
      genre = GenreStorage.fetch.find { |genr| genr.id == album['genre'] }
      label = LabelStorage.fetch.find { |labe| labe.id == album['label'] }

      new_album = MusicAlbum.new(album['id'], genre, album['author'], album['source'], label, album['on_spotify'],
                                 album['published_date'])
      temp.push(new_album)
    end
    temp
  end
end
