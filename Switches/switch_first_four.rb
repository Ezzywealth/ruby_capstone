require_relative '../Listing/list_books.rb'

def switch_first_four(choice)
  puts "you chose from the first 4: Number #{choice}"
  case choice
  when 1
    list_all_books(@books)
  when 2
    puts 'you chose 2'
  when 3
    puts 'you chose 3'
  when 4
    puts 'you chose 4'
  end
end
