
require_relative '../Listing/list_labels'

def switch_next_four(choice)
  case choice
  when 5
    puts 'you chose 5'
  when 6
    list_all_labels(@labels)
  when 7
    puts 'you chose 7'
  when 8
    puts 'you chose 8'
  end
  run
end
