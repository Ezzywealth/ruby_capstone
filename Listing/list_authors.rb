def list_all_authors(authors)
  if authors.empty?
    puts 'You have No recorded authors yet! '
    puts
  else
    authors.each do |author|
      puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end
end
