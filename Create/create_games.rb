require_relative '../Classes/game'
require_relative './create'
require_relative '../app'

class CreateGame < Create
  def create(games)
    puts 'Enter Multiplayer:'
    multiplayer = gets.chomp
    puts 'Enter last played date:'
    last_played_date = gets.chomp
    create_class(multiplayer, last_played_date, games)
  end

  def create_class(multiplayer, last_played_date, games)
    print "Enter published date 'yyyy/mm/date': "
    published_date = gets.chomp
    game = Game.new(multiplayer, last_played_date, published_date)
    games.push(game)
    puts "Game Recorded: #{game.multiplayer} by #{game.last_played_date}"
  end
end
