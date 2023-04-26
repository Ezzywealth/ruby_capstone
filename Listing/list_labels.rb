def list_all_labels(labels)
  if labels.empty?
    puts 'No labels in the library'
    run
  else
    puts 'Labels in the library:'
    labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title}"
    end
  end
  puts '==============================================================================='
end
