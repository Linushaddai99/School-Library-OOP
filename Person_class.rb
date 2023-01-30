class Person
  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000),
          @name = name,
          @age = age,
          @parent_permission = parent_permission
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

  def of_age?
    return true if @age >= 18


    false
  end
end
