require_relative '../Listing/list_labels'
require_relative '../Listing/list_genres'


def switch_next_four(choice)
  case choice
  when '5'
    list_all_genres(@genres)
  when '6'
    list_all_labels(@labels)
  when '7'
    puts 'you chose 7'
  when '8'
    puts 'you chose 8'
  end
end
