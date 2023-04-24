require_relative 'app'

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

main(lists_of_options)
