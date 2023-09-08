require_relative '../class/nameable'

class TestingNameable < Nameable
  def correct_name
    'Fickry Bil Iman'
  end
end

describe Nameable do
  before :each do
    @dummy_nameable = TestingNameable.new
  end

  describe '-> Method (.correct_name)' do
    it 'should return the correct name' do
      expect(@dummy_nameable.correct_name).to eq('Fickry Bil Iman')
    end
  end
end
