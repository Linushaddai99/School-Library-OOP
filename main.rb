require './app'

def options
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a giving person id'
  puts '7 - Exit'
end

def choose_options(input, app)
  case input
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App'
  loop do
    options
    input = gets.chomp.to_i
    choose_options(input, app)
    return if input == 7
  end
end

main
