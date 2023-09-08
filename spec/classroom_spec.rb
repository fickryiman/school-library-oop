require_relative '../class/classroom'
require_relative '../class/student'

describe Classroom do
  before :each do
    @dummy_classroom = Classroom.new('Database')
  end

  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Classroom class' do
      expect(@dummy_classroom).to be_an_instance_of(Classroom)
    end
  end

  describe '-> Label instance variable' do
    it 'label instance variable must be equal "Database"' do
      expect(@dummy_classroom.label).to eql('Database')
    end
  end

  describe '-> Method (.add_student)' do
    it 'should have 2 students inside the classroom' do
      fathin = Student.new(13, parent_permission: true, name: 'Fathin')
      fathan = Student.new(8, parent_permission: false, name: 'Fathan')

      @dummy_classroom.add_student(fathin)
      @dummy_classroom.add_student(fathan)

      expect(@dummy_classroom.students.length).to eql(2)
    end
  end
end
