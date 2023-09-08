require_relative '../class/capitalize_decorator'

describe CapitalizeDecorator do
  before :each do
    @dummy_capitalize_decorator = CapitalizeDecorator.new('Fickry')
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of CapitalizeDecorator class' do
      expect(@dummy_capitalize_decorator).to be_an_instance_of CapitalizeDecorator
    end
  end
end
