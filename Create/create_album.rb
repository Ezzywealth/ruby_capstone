require_relative '../Classes/album'
require_relative './create'
require_relative '../app'
require_relative '../Classes/genre'
require_relative '../Classes/label'
# rubocop:disable Metrics/ParameterLists

class CreateAlbum < Create
  def create(albums, labels, genres)
    print 'Enter music album genre: '
    genre_name = gets.chomp
    print 'Enter music author name: '
    music_album_author = gets.chomp
    print 'Enter music album label title: '
    label_title = gets.chomp
    print 'Enter book label color:  '
    label_color = gets.chomp
    crete_music_class(albums, labels, genres, genre_name, music_album_author, label_title, label_color)
  end

  def crete_music_class(albums, labels, genres, genre_name, music_album_author, label_title, label_color)
    print 'Enter music album source: '
    source = gets.chomp
    print "Enter music album published date 'yyyy/mm/date': "
    published_date = gets.chomp
    print 'Is the album avalible on Spotify [Y/N]: '
    on_spotify = gets.chomp
    label = Label.new(nil, label_title, label_color)
    genre = Genre.new(nil, genre_name)
    album = MusicAlbum.new(nil, genre, music_album_author, source, label, published_date,
                           on_spotify)
    albums.push(album)
    genres.push(genre)
    labels.push(label)
    puts "Music album #{album.label.title} created by #{album.author} succesfuly!"
    puts '==========================================================='
  end
end
# rubocop:enable Metrics/ParameterLists
