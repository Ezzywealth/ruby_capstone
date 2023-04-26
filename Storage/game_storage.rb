require 'json'
require_relative './storage'
require_relative '../Classes/game'

class GameStorage < Storage
  @games = []

  class << self
    attr_accessor :games
  end

  def self.fetch
    games = if File.exist?('./data/games.json')
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
      last_played_at: game.last_played_at
    }
  end

  def self.deserialize(games)
    temp = []
    games.each do |game|
      new_game = Game.new(game['multiplayer'], game['last_played_at'])
      temp.push(new_game)
    end
    temp
  end
end
