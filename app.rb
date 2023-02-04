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
    puts 'Do you want to create a student (1) or a teacher (2)?[input the number]:'
    answer = gets.chomp
    case answer
    when '1'
      create_student

    when '2'
      create_teacher
    else puts 'Invalid input'
    end
  end

  # Create a student
  def create_student
    print 'Enter your age: '
    student_age = gets.chomp.to_i

    print 'Enter your name: '
    student_name = gets.chomp

    print 'Parent permission[Y/N]: '
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
    puts 'Person created successfully'
  end

  # Create a teacher
  def create_teacher
    print 'Enter your age: '
    teacher_age = gets.chomp

    print 'Enter your name: '
    teacher_name = gets.chomp

    print 'Enter your specialization: '
    teacher_specialization = gets.chomp

    teacher = Teacher.new(teacher_age, teacher_specialization, teacher_name)
    puts 'Person created successfully'
    @people << teacher
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
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

  # List all rental by a given person
  def list_rentals
    print 'Id of person:'
    id = gets.chomp.to_i

    person = @people.find { |p| p.id == id }
    if person.nil?
      puts "No person found with id #{id}"
      return
    end

    puts 'Rentals: '

    rentals = @rentals.select { |r| r.id == id }
    if rentals.empty?
      puts "No rentals found for person with id #{id}"
      return
    end

    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}"
    end
  end
end
