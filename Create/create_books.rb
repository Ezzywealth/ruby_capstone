require_relative '../Classes/book'
require_relative './create.rb'
require_relative '../app.rb'

class CreateBook < Create

  def create(books, labels, genres)
    print 'Enter book genre:  '

  genre = gets.chomp

  print 'Enter book author first name:  '

  author_first_name = gets.chomp

  print 'Enter book author last name:  '

  author_last_name = gets.chomp

  print 'Enter book source:  '
  source = gets.chomp

  print 'Enter book label title:  '
  label_title = gets.chomp

  print 'Enter book label color:  '
  label_color = gets.chomp

  print 'Enter book cover state:  '
  cover_state = gets.chomp

  print 'Enter book publisher:  '
  publisher = gets.chomp

  book = Book.new(nil,genre,author_first_name, author_last_name, source,label_title,label_color,cover_state, publisher)
  puts book.inspect
  books.push(book)
  labels.push(book.label)
  genres.push(book.genre)

  puts "Book created: #{book.label.title} by #{book.author}"
end
end
