require './book'
require './person'
require './student'
require './teacher'
require './rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_message(message, is_print)
    if is_print
      print message
    else
      puts message
    end
  end

  # List all books
  def list_all_books
    @books.each { |book| puts "Name: #{book.title}, Author: #{book.author}" }
  end

  # List all people
  def list_all_people
    @people.each { |person| puts "#{[person.class]} Id: #{person.id[0]}, Name: #{person.name}, Age: #{person.age}" }
  end

  # Create person
  def create_person
    display_message('Do you want to create a student (1) or a teacher (2)?[input the number]:', false)
    answer = gets.chomp
    case answer
    when '1'
      create_student

    when '2'
      create_teacher
    else display_message('Invalid input', false)
    end
  end

  # Create a student
  def create_student
    display_message('Enter your age: ', true)
    student_age = gets.chomp.to_i

    display_message('Enter your name: ', true)
    student_name = gets.chomp

    display_message('Parent permission[Y/N]: ', true)
    parent_permission = gets.chomp

    case parent_permission
    when 'Y'
      parent_permission = true

    when 'N'
      parent_permission = false

    else
      'Invalid input'
    end

    student = Student.new(student_age, student_name, parent_permission: parent_permission)
    @people << student
    display_message('Person created successfully', false)
  end

  # Create a teacher
  def create_teacher
    display_message('Enter your age: ', true)
    teacher_age = gets.chomp

    display_message('Enter your name: ', true)
    teacher_name = gets.chomp

    display_message('Enter your specialization: ', true)
    teacher_specialization = gets.chomp

    teacher = Teacher.new(teacher_age, teacher_specialization, teacher_name)
    display_message('Person created successfully', false)
    @people << teacher
  end

  # Create a book
  def create_book
    display_message('Title: ', true)
    title = gets.chomp

    display_message('Author: ', true)
    author = gets.chomp
    book = Book.new(title, author)
    @books << book

    display_message('Book created successfully', false)
  end

  # Create a rental
  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    rented_book = @books[book_index]

    puts 'Select a person from the following list by number (not id): '
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    selected_person = @people[person_id]

    puts 'Enter date[yyyy-mm-dd]: '
    rent_date = gets.chomp

    rental = Rental.new(rent_date, selected_person, rented_book)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print "\nEnter person id (not number): "
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts " Date: #{rent.date} Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
    end
  end
end
