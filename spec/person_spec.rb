require_relative '../class/person'
require 'date'

describe Person do
  before :each do
    @person = Person.new(41, parent_permission: true, name: 'Keanu Reaves')
    @book = double('Book')
  end

  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Person class' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'should have the instance variables' do
      expect(@person.name).to eql('Keanu Reaves')
      expect(@person.age).to eql(41)
      expect(@person.parent_permission).to be true
    end
  end

  describe '-> Method (.can_use_services)' do
    it 'should be true for an age > 18' do
      expect(@person.can_use_services?).to be true
    end
  end

  describe '-> Method (.correct_name)' do
    it 'should return the correct name' do
      expect(@person.correct_name).to eql('Keanu Reaves')
    end
  end

  describe '-> Method (.add_rental)' do
    it 'should create a new rental record' do
      date = Date.today
      expect(Rental).to receive(:new).with(date, @book, @person)
      @person.add_rental(@book, date)
    end
  end
end
