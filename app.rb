require_relative 'Switches/switch_first_four'
require_relative 'Switches/switch_next_four'
require_relative 'Switches/switch_last_four'
require_relative 'Classes/welcome'
require_relative 'Storage/book_storage'
require_relative 'Storage/game_storage'
require_relative 'Storage/label_storage'
require_relative 'Storage/genre_storage'
require_relative 'Storage/author_storage'
require_relative 'Storage/album_storage'

class App
  attr_accessor :genres, :labels

  def initialize(lists_of_options)
    @lists_of_options = lists_of_options
    @labels = LabelStorage.fetch || []
    @genres = GenreStorage.fetch || []
    @authors = []
    @books = BookStorage.fetch || []
    @games = GameStorage.fetch || [][]
    @authors = AuthorStorage.fetch || [][]
    @welcome = Welcome.new
    @albums = AlbumStorage.fetch || []
  end

  def quit_app
    LabelStorage.save(@labels)
    GenreStorage.save(@genres)
    BookStorage.save(@books)
    GameStorage.save(@games)
    AuthorStorage.save(@authors)
    AlbumStorage.save(@albums)
    puts 'Thank you for using this app!'
  end

  def run
    @welcome.welcome
    loop do
      @welcome.menu(@lists_of_options)
      choice = gets.chomp
      case choice
      when '1', '2', '3', '4'
        switch_first_four(choice)
      when '5', '6', '7', '8'
        switch_next_four(choice)
      when '9', '10', '11', '12'
        switch_last_four(choice)
      when '13'
        break quit_app
      end
    end
  end
end
