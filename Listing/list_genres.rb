def list_all_genres(genres)
  if genres.empty?
    puts 'No genres in the library'
    run
  else
    puts 'Genres in the library:'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
end
