class Welcome
  def welcome
    puts 'Welcome to your media library!'
    puts 'Please choose from the following options:'
  end

  def menu(lists)
    lists.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end
end
