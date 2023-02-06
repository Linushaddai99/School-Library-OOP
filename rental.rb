class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  def to_s
    "Date: #{@date}, Book: #{@book.title}, By #{@book.author}"
  end
end
