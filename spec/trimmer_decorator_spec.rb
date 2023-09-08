require_relative '../class/trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  subject(:decorated_nameable) { described_class.new(nameable) }

  before :each do
    @dummy_trimmer_decorator = TrimmerDecorator.new('Fickry')
  end

  describe '-> Initialize class (.new)' do
    it 'should be create an instance of TrimmerDecorator class' do
      expect(@dummy_trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end
  end

  describe '-> Method (.correct_name)' do
    it 'returns the correct name from the decorated object without whitespace' do
      allow(nameable).to receive(:correct_name).and_return('  Fickry  ')
      expect(decorated_nameable.correct_name).to eq('Fickry')
    end

    it 'returns the correct name from the decorated object as is' do
      allow(nameable).to receive(:correct_name).and_return('lorem ipsum dolor')
      expect(decorated_nameable.correct_name).to eq('Lorem ipsu')
    end

    it 'returns the correct name from the decorated object without truncation' do
      nameable = double('nameable')
      decorated_nameable = TrimmerDecorator.new(nameable)

      allow(nameable).to receive(:correct_name).and_return('John')

      result = decorated_nameable.correct_name

      expect(result).to eq('John')
    end

    it 'returns the correct name from the decorated object with truncation' do
      nameable = double('nameable')
      decorated_nameable = TrimmerDecorator.new(nameable)

      allow(nameable).to receive(:correct_name).and_return('lorem ipsum dolor')

      result = decorated_nameable.correct_name

      expect(result).to eq('Lorem ipsu')
    end
  end
end
