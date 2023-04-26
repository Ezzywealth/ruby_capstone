def list_all_games
  if @games.empty?
    puts 'No recorded games yet!'
    puts
  else
    @games.each do |game|
      puts "Multiplayer: #{game['multiplayer']}, Last Played Date: #{game['last_played_at']}"
    end
  end
end
