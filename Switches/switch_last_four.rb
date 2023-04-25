require_relative '../Create/create_books'


def switch_last_four(choice)
  case choice
  when 9
    CreateBook.new.create(@books, @labels, @genres)
  when 10
    puts 'you chose 10'
  when 11
    puts 'you chose 11'
  when 12
    puts 'you chose 12'
  end
  run
end
