require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000),
          @name = name,
          @age = age,
          @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :id, :name, :age
  attr_reader :rentals

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
