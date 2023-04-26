require 'rspec'
require_relative '../Classes/game'
require_relative '../Classes/label'
require_relative '../Classes/genre'
require_relative '../Classes/author'

describe Game do
  let(:label) do
    Label.new(nil, 'Jtag', 'White')
  end
  let(:author) do
    Author.new(nil, 'Juhar', 'yimer')
  end
  let(:genre) do
    Genre.new(nil, 'Adventure')
  end

  before(:each) do
    @game = Game.new('ahmed', '2010/10/12', nil, genre, author, 'Allen & Unwin',
                     label, '2010/10/12')
  end

  context 'when creating a new game' do
    it 'should create a new game' do
      game = Game.new('ahmed', 'Ibrahim', nil, genre, author, 'Allen & Unwin',
                      label, '2010')
      expect(game.label.title).to eq('Jtag')
    end

    it 'should create a new game with a genre of Adventure' do
      expect(@game.genre.name).to eq('Adventure')
    end

    it 'should create a new game with a Author of Juhar' do
      expect(@game.author.first_name).to eq('Juhar')
    end

    it 'should create a new game with a source of The Lord of the Rings' do
      expect(@game.source).to eq('Allen & Unwin')
    end
  end

  context 'when checking if a game can be archived' do
    it 'should return true if the cover state is bad or publish year is greater than 10 years ago' do
      expect(@game.can_be_archived?).to eq(true)
    end

    it 'should return false if the publish year is less than 10 years ago' do
      game = Game.new('ahmed', 'Ibrahim', nil, genre, author, 'Allen & Unwin', label, '2022-10-12')
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
