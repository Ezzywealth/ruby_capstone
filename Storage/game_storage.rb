require 'json'
require_relative './storage'
require_relative '../Classes/game'
require_relative '../Classes/genre'
require_relative '../Classes/label'
require_relative '../Classes/author'

class GameStorage < Storage
  @games = []

  class << self
    attr_accessor :games
  end

  def self.fetch
    games = if File.exist?('./data/games.json') && File.size('./data/games.json').positive?
              JSON.parse(File.read('./data/games.json'))
            else
              []
            end
    deserialize(games)
  end

  def self.save(games)
    games.each do |game|
      GameStorage.games.push(serialize(game))
    end
    File.write('./data/games.json', JSON.pretty_generate(GameStorage.games))
  end

  def self.serialize(game)
    {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      id: game.id,
      genre:
      {
        id: game.genre.id,
        name: game.genre.name
      },
      author:
      {
        id: game.author.id,
        first_name: game.author.first_name,
        last_name: game.author.last_name
      },
      source: game.source,
      label:
      {
        id: game.label.id,
        title: game.label.title,
        color: game.label.color
      },
      published_date: game.published_date
    }
  end

  def self.deserialize(games)
    temp = []
    games.each do |game|
      genre = GenreStorage.fetch.find { |genr| genr.id == game['genre']['id'] }
      label = LabelStorage.fetch.find { |labe| labe.id == game['label']['id'] }
      autor = AuthorStorage.fetch.find { |author| author.id == game['author']['id'] }
      new_game = Game.new(game['multiplayer'], game['last_played_at'], game['id'], genre, autor, game['source'], label,
                          game['published_date'])
      temp.push(new_game)
    end
    temp
  end
end
