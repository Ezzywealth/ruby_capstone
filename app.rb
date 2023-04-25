require_relative 'Switches/switch_first_four'
require_relative 'Switches/switch_next_four'
require_relative 'Switches/switch_last_four'
require_relative 'Classes/welcome'
require_relative 'Storage/book_storage.rb'

class App
  def initialize(lists_of_options)
    @lists_of_options = lists_of_options
    @books = BookStorage.fetch || []
    @labels = []
    @welcome = Welcome.new
    @genres = []
  end

  def quit_app
    BookStorage.save(@books)
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
