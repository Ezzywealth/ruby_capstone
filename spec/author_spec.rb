require_relative '../Classes/author'

describe 'Autor Class:' do
  before :each do
    @author = Author.new(nil, 'Yismake', 'Worku')
  end

  context 'New Author Class:' do
    it 'should have the following attributes (first name, last name, and id)' do
      expect(@author.first_name).to eql 'Yismake'
      expect(@author.last_name).to eql 'Worku'
    end
    it 'should be an instance of the class Author' do
      expect(@author).to be_instance_of Author
    end
  end
end
