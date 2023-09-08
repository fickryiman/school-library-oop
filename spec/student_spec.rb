require_relative '../class/student'

describe Student do
  before :each do
    @student = Student.new(19, parent_permission: true, name: 'Farrel Adithya')
  end

  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Student class' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'should have the instance variables' do
      expect(@student.name).to eql('Farrel Adithya')
      expect(@student.age).to eql(19)
      expect(@student.parent_permission).to be true
    end
  end

  describe '-> Method (.play_hooky)' do
    it 'should return the string "¯(ツ)/¯" ' do
      expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end
  end
end
