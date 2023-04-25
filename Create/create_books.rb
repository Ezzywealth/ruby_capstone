require_relative '../Classes/book'
require_relative './create'
require_relative '../app'
require_relative '../Classes/genre'
require_relative '../Classes/label'

class CreateBook < Create
  def create(books, labels, genres)
    print 'Enter book genre:  '
    genre_name = gets.chomp
    print 'Enter book author first name:  '
    author_first_name = gets.chomp
    print 'Enter book author last name:  '
    author_last_name = gets.chomp
    author = "#{author_first_name} #{author_last_name}"
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
    label = Label.new(nil, label_title, label_color)
    genre = Genre.new(nil, genre_name)
    book = Book.new(nil, genre, author, source, label, cover_state, publisher)
    puts book.inspect
    books.push(book)
    labels.push(book.label)
    genres.push(book.genre)

    puts "Book created: #{book.label.title} by #{book.author}"
  end
end
