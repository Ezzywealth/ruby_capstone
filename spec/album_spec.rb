require_relative '../Classes/album'
require_relative '../Classes/item'

describe MusicAlbum do
  describe '#initialize' do
    it 'should set the id, publish_date, archived, and on_spotify attributes' do
      album = MusicAlbum.new(1, 'Fantasy', 'J.R.R.', 'The Lord of the Rings', 'The Hobbit', 'red',
                             'Allen & Unwin', '2010-10-12', false)
      expect(album.id).to eq(1)
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the item can be archived and is on Spotify' do
      album = MusicAlbum.new(2, 'Fantasy', 'J.R.R.', 'The Lord of the Rings', 'The Hobbit', 'red',
                             'Allen & Unwin', '2010-10-12', true)
      expect(album.can_be_archived?).to be_truthy
    end

    it 'should return false if the item cannot be archived' do
      album = MusicAlbum.new(3, 'Fantasy', 'J.R.R.', 'The Lord of the Rings', 'The Hobbit', 'red',
                             'Allen & Unwin', '2010-10-12', false)
      expect(album.can_be_archived?).to be_falsey
    end

    it 'should return false if the item is not on Spotify' do
      album = MusicAlbum.new(4, 'Fantasy', 'J.R.R.', 'The Lord of the Rings', 'The Hobbit', 'red',
                             'Allen & Unwin', '2010-10-12', false)
      expect(album.can_be_archived?).to be_falsey
    end
  end
end
