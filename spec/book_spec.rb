require_relative '../class/book'

describe Book do
  before :each do
    @book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    @book2 = Book.new('Harry Potter', 'JK. Rowling')
    @rental = double('Rental')
  end

  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Book class' do
      expect(@book1).to be_an_instance_of(Book)
    end

    it 'should have the instance variables' do
      expect(@book1.title).to eql('The Great Gatsby')
      expect(@book1.author).to eql('F. Scott Fitzgerald')
      expect(@book1.rentals).to be_empty
    end
  end

  describe '-> Method (.add_rental)' do
    let(:rental) { instance_double('Rental') }

    it 'should add a json data into the rentals array' do
      expect(@rental).to receive(:book=).with(@book2)

      @book2.add_rental(@rental)

      expect(@book2.rentals).to include(@rental)
    end
  end
end
