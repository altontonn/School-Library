require './person'
class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission, classroom, role = 'Student')
    super(name, age, role, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
