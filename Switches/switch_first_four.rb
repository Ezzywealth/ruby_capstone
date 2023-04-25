require_relative '../Listing/list_books'
require_relative '../Listing/list_album'

def switch_first_four(choice)
  case choice
  when '1'
    list_all_books(@books)
  when '2'
    list_all_albums(@albums)
  when '3'
    puts 'you chose 3'
  when '4'
    puts 'you chose 4'
  end
end
