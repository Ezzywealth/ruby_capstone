require_relative '../Create/create_books'
require_relative '../Create/create_games'
require_relative '../Create/create_album'

def switch_last_four(choice)
  case choice
  when '9'
    CreateBook.new.create(@books, @labels, @genres, @authors)
  when '10'
    CreateAlbum.new.create(@albums, @labels, @genres, @authors)
  when '11'
    puts 'Add movie feature not implemented yet'
  when '12'
    CreateGame.new.create(@games, @labels, @genres, @authors)
  end
end
