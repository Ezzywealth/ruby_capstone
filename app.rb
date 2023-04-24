require_relative 'Switches/switch_first_four'
require_relative 'Switches/switch_next_four'
require_relative 'Switches/switch_last_four'
require_relative 'Classes/welcome'

class App
  def initialize(lists_of_options)
    @lists_of_options = lists_of_options
    @books = []
    @labels = []
    @welcome = Welcome.new
    @genres = []
  end


  def run
    @welcome.welcome

    @lists_of_options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end

    loop do
    choice = gets.chomp.to_i
      case choice
      when 1, 2, 3, 4
        switch_first_four(choice)
      when 5, 6, 7, 8
        switch_next_four(choice)
      when 9, 10, 11, 12
        switch_last_four(choice)
      when 13, 'q', 'quit'
        break
      end
    end
  end
end
