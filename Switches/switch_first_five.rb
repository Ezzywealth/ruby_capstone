def switch_first_five(choice)
  puts "you chose from the first 5: Number #{choice}"
  case choice
  when 1
    list_all_books(@books)
  end
end
