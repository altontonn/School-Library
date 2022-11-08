require './person'
class Teacher < Person
  def initialize(specialization, name, parent_permission: 'true')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end