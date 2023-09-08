require_relative '../class/capitalize_decorator'
require_relative '../class/decorator'
require_relative '../class/nameable'

describe CapitalizeDecorator do
  before :each do
    @dummy_capitalize_decorator = CapitalizeDecorator.new('john doe')
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of CapitalizeDecorator class' do
      expect(@dummy_capitalize_decorator).to be_an_instance_of CapitalizeDecorator
    end
  end

  describe '-> Method (.correct_name)' do
    it 'should change the first letter of name is uppercase' do
      nameable = double('nameable')
      decorated_nameable = CapitalizeDecorator.new(nameable)

      allow(nameable).to receive(:correct_name).and_return('fickry')
      result = decorated_nameable.correct_name
      expect(result).to eql('Fickry')
    end
  end
end
