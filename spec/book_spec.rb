require 'rspec'
require_relative '../Classes/book'

# id,genre,author_first_name, author_last_name, source,label_title,label_color,cover_state, publisher
describe Book do
  before(:each) do
    @book = Book.new(1, 'Fantasy', 'J.R.R.', 'Tolkien', 'The Lord of the Rings', 'The Hobbit', 'red', 'bad', 'Allen & Unwin', '2010-10-12')
  end

  context 'when creating a new book' do
    it 'should create a new book' do
      book = Book.new(1, 'Fantasy', 'J.R.R.', 'Tolkien', 'The Lord of the Rings', 'The Hobbit', 'red', 'bad', 'Allen & Unwin', '2010-10-12')
      expect(book.label.title).to eq('The Hobbit')
    end

    it 'should create a new book with a genre of Fantasy' do
      expect(@book.genre.name).to eq('Fantasy')
    end

    it 'should create a new book with a source of The Lord of the Rings' do
      expect(@book.source).to eq('The Lord of the Rings')
    end
  end

  context 'when checking if a book can be archived' do
    it 'should return true if the cover state is bad or publish year is greater than 10 years ago' do
      expect(@book.can_be_archived?).to eq(true)
    end

    it 'should return false if the publish year is less than 10 years ago' do
      book = Book.new(1, 'Fantasy', 'J.R.R.', 'Tolkien', 'The Lord of the Rings', 'The Hobbit', 'red', 'good', 'Allen & Unwin', '2020-10-12')
      expect(book.can_be_archived?).to eq(false)
    end
  end

end
