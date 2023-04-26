require_relative '../Classes/game'
require_relative './create'
require_relative '../app'
require_relative '../Classes/genre'
require_relative '../Classes/label'
require_relative '../Classes/author'

class CreateGame < Create
  def create(games, labels, genres, authors)
    print 'Enter game genre:  '
    genre_name = gets.chomp
    print 'Enter game label title:  '
    create_class(genre_name, games, labels, genres, authors)
  end

  def create_class(genre_name, games, labels, genres, authors)
    print 'Enter game author first name:  '
    author_first_name = gets.chomp
    print 'Enter game author last name:  '
    author_last_name = gets.chomp
    print 'Enter book source:  '
    source = gets.chomp
    label_title = gets.chomp
    print 'Enter Label color:  '
    label_color = gets.chomp
    print 'Enter multiplayer:  '
    multi_player = gets.chomp
    print 'Enter Last played at:  '
    last_played_at = gets.chomp
    print "Enter published date 'yyyy/mm/date': "
    published_date = gets.chomp
    label = Label.new(nil, label_title, label_color)
    genre = Genre.new(nil, genre_name)
    author = Author.new(author_first_name, author_last_name, nil)
    game = Game.new(multi_player, last_played_at, nil, genre, author, source, label, published_date)
    games.push(game)
    labels.push(label)
    genres.push(genre)
    authors.push(author)
    puts "Game created: #{game.label.title} by #{game.author.first_name} #{game.author.last_name}"
  end
end
