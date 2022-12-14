require './nameable'
class Person < Nameable
  def initialize(name, age, role, parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @role = role
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
  attr_reader :id, :rentals
  attr_accessor :name, :age, :role

  def add_rentals(person, date)
    new Rental(date, self, person)
    rentals.push(rentals)
  end

  def correct_name
    @name
  end
end
