class Person
  attr_accessor :id, :name, :age
  def initialize(name: "Unknown", age, parent_permission: true)
    @name = name,
    @age = age,
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name(value)
    @name = value
  end

  def age(value)
    @age = value
  end

  def can_use_services?
    true
  end

  private

  def is_of_age?
    if @age >= 18
      true
      else false
    end
  end
end