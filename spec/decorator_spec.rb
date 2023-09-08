require_relative '../class/decorator'

describe Decorator do
  before :each do
    @dummy_object = double('Nameable', correct_name: 'Dummy Name')
    @decorator_object = Decorator.new(@dummy_object)
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of Decorator class' do
      expect(@decorator_object).to be_an_instance_of(Decorator)
    end
  end

  describe '-> Method (.correct_name)' do
    it 'should return the instance variable with correct_name from decorator object' do
      expect(@decorator_object.correct_name).to eql('Dummy Name')
    end
  end
end
