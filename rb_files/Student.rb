require_relative "./Person"

class Student < Person
  def initialize (classroom, name, age = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end