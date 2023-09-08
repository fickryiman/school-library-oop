require_relative '../class/rental'
describe Rental do
  let(:person) { instance_double('Andrea Hirata', rentals: []) }
  let(:book) { instance_double('Book', title: 'Sang Pemimpi', rentals: []) }
  before :each do
    @rental = Rental.new('2023-09-08', person, book)
  end
  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Rental class' do
      expect(@rental).to be_an_instance_of(Rental)
    end
    it 'should have the instance variables' do
      expect(@rental.date).to eql('2023-09-08')
      expect(@rental.person).to eql(person)
      expect(@rental.book).to eql(book)
    end
    it 'should add self to person rentals' do
      expect(person.rentals).to include(@rental)
    end
    it 'should add self to book rentals' do
      expect(book.rentals).to include(@rental)
    end
  end
end
