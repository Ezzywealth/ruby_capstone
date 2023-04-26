require_relative '../Listing/list_labels'
require_relative '../Listing/list_genres'
require_relative '../Listing/list_authors'

def switch_next_four(choice)
  case choice
  when '5'
    list_all_genres(@genres)
  when '6'
    list_all_labels(@labels)
  when '7'
    list_all_authors(@authors)
  when '8'
    puts 'you chose 8'
  end
end
