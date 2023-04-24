require_relative 'book'

def create_book
  print 'Enter book genre:  '

  genre = gets.chomp

  print 'Enter book author:  '

  author = gets.chomp

  print 'Enter book source:  '
  source = gets.chomp

  print 'Enter book label:  '
  label = gets.chomp

  book = Book.new(title, author)

  @books << book

  puts "Book created: #{book.title} by #{book.author}"
end
