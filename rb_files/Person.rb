class Person
  def initialize(name, age = 'Unknown', parent_permission = 'true')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getter
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  # Setter
  def name(name)
    @name = name
  end

  def age(age)
    @age = age
  end

  private

  def is_of_age?
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
