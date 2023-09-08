require_relative '../class/trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  subject(:decorated_nameable) { described_class.new(nameable) }

  before :each do
    @dummy_trimmer_decorator = TrimmerDecorator.new('Fickry Bil Iman')
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of TrimmerDecorator class' do
      expect(@dummy_trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end
  end

  describe '-> Method (.correct_name)' do
    it 'returns the correct name from the decorated object without whitespace' do
      allow(nameable).to receive(:correct_name).and_return('  Fickry Bil Iman  ')
      expect(decorated_nameable.correct_name).to eq('Fickry Bil Iman')
    end

    it 'returns the correct name from the decorated object as is' do
      allow(nameable).to receive(:correct_name).and_return('Fickry Bil Iman')
      expect(decorated_nameable.correct_name).to eq('Fickry Bil Iman')
    end
  end
end
