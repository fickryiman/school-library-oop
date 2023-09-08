require_relative '../class/trimmer_decorator'

describe TrimmerDecorator do
  before :each do
    @dummy_trimmer_decorator = TrimmerDecorator.new('Fickry Bil Iman')
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of TrimmerDecorator class' do
      expect(@dummy_trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end
  end
end
