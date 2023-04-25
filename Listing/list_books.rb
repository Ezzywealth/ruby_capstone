def list_all_books(books)
  books.empty? ? (puts 'No books in the library') : (puts 'Books in the library:')
  books.each_with_index do |book, index|
    puts "#{index + 1}. #{book.label.title} by #{book.author}"
  end
end
