def list_all_games(games)
  if games.empty?
    puts 'No recorded games yet!'
    puts
  else
    games.each_with_index do |game, index|
      puts "#{index + 1}. Name: #{game.label.title}, Last Played Date: #{game.last_played_at}"
    end
  end
  puts "==============================================================================="
end
