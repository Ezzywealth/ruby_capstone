require_relative '../Classes/album'
require_relative './create'
require_relative '../app'
require_relative '../Classes/genre'
require_relative '../Classes/label'
require_relative '../Classes/author'
class CreateAlbum < Create
  def create(albums, labels, genres, authors)
    print 'Enter music album genre: '
    genre_name = gets.chomp
    print 'Enter music author first name: '
    author_first_name = gets.chomp
    print 'Enter music author last name: '
    author_last_name = gets.chomp
    print 'Enter music album label title: '
    label_title = gets.chomp
    print 'Enter book label color:  '
    label_color = gets.chomp

    author = Author.new(nil, author_first_name, author_last_name)
    crete_music_class(albums, labels, genres, genre_name, author, label_title, label_color, authors)
  end

  def crete_music_class(albums, labels, genres, genre_name, author, label_title, label_color, authors)
    print 'Enter music album source: '
    source = gets.chomp
    print "Enter music album published date 'yyyy/mm/date': "
    published_date = gets.chomp
    print 'Is the album avalible on Spotify [Y/N]: '
    on_spotify = gets.chomp
    label = Label.new(nil, label_title, label_color)
    genre = Genre.new(nil, genre_name)
    album = MusicAlbum.new(nil, genre, author, source, label, published_date,
                           on_spotify)
    albums.push(album)
    genres.push(genre)
    labels.push(label)
    authors.push(author)
    puts "Music album #{album.label.title} created by #{album.author} succesfuly!"
    puts '==========================================================='
  end
end
# rubocop:enable Metrics/ParameterLists
