require_relative '../class/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(47, 'Mentality', parent_permission: true, name: 'Agus Cucol')
  end

  describe '-> Initialize class (.new) ' do
    it 'should be create an instance of Teacher class' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'should have the instance variables' do
      expect(@teacher.name).to eql('Agus Cucol')
      expect(@teacher.age).to eql(47)
      expect(@teacher.specialization).to eql('Mentality')
      expect(@teacher.parent_permission).to be true
    end
  end

  describe '-> Method (.can_use_services?)' do
    it 'should always return true for Teacher instance' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
