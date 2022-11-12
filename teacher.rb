require './person'
class Teacher < Person
  def initialize(specialization, name, age, role = 'Teacher')
    super(name, age, role)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
