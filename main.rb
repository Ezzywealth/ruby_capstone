require_relative 'app'
require 'time'

lists_of_options = ['List all books',
                    'List all music albums',
                    'List all movies',
                    'List of games',
                    'List all genres',
                    'List all labels',
                    'List all authors',
                    'List all sources',
                    'Add a book',
                    'Add a music album',
                    'Add a movie',
                    'Add a game',
                    'Quit the program']

def main(lists_of_options)
  app = App.new(lists_of_options)
  app.run
end

date = Time.parse('2020-01-01')
puts ((Time.now - date) / 60 / 60 / 24 / 365).to_i

main(lists_of_options)
