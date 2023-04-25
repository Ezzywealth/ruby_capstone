require_relative '../Classes/label'
require_relative '../Classes/book'

describe Label do
  let(:book1) do
    Book.new(1, 'Fantasy', 'J.R.R.', 'Tolkien', 'The Lord of the Rings', 'The Hobbit', 'red', 'bad', 'Allen & Unwin',
             '2010-10-12')
  end

  let(:book2) do
    Book.new(1, 'Comic', 'Donald', 'Trump', 'American Savage', 'Washington', 'blue', 'good', 'Barrack Obama',
             '2022-10-12')
  end

  before(:each) do
    @label = Label.new(1, 'The Hobbit', 'red')
  end

  context 'when creating a new label' do
    it 'should create a new label' do
      @label.add_item(book1)
      expect(@label.items).to include(book1)
    end

    it 'should create a second new label' do
      @label.add_item(book2)
      expect(@label.items).to include(book2)
    end
  end
end
