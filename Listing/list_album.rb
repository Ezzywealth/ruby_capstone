def list_all_albums(albums)
  albums.empty? ? (puts 'No music albums in the library') : (puts 'Music albums in the library:')
  albums.each_with_index do |album, index|
    puts "#{index + 1}. #{album.label.title} by #{album.author}"
  end
  puts '==========================================================='
end
