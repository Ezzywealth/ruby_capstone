require_relative 'Switches/switch_first_five'
require_relative 'Switches/switch_next_four'
require_relative 'Switches/switch_last_four'

class App
  def initialize(lists_of_options)
    @lists_of_options = lists_of_options
  end

  def run
    puts 'Welcome to your media library!'

    puts 'Please choose from the following options:'

    @lists_of_options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end

    choice = gets.chomp.to_i

    case choice
    when 1, 2, 3, 4, 5
      switch_first_five(choice)
    when 6, 7, 8, 9
      switch_next_four(choice)
    when 10, 11, 12, 13
      switch_last_four(choice)
    end
  end
end
