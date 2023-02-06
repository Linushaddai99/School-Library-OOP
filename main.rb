require './app'

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
  options = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a giving person id',
    'Exit'
  ]
  loop do
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    input = gets.chomp.to_i
    choose_options(input, app)
    return if input == 7
  end
end

main
