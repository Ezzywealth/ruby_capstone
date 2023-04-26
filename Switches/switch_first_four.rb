require_relative '../Listing/list_books'
require_relative '../Listing/list_games'

def switch_first_four(choice)
  case choice
  when '1'
    list_all_books(@books)
  when '2'
    puts 'you chose 2'
  when '3'
    puts 'you chose 3'
  when '4'
    list_all_games(@games)
  end
end
