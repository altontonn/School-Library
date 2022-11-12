require './book'
require './rental'
require './classroom'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @persons = []
    @classroom = []
  end

  def welcome_message
    puts 'Welcome to School Library App'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank you for using school library'
        break
      end
      option input
    end
  end

  def create_person
    puts 'Press 1 for Teacher and 2 for Student: '
    option = gets.chomp
    case option
    when '1'
      create_teacher
    when '2'
      create_student
    else
      puts 'Invalid Choice. Please try again'
    end
  end

  def create_teacher
    puts 'Create new teacher'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp
    puts 'Enter teacher specialization'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    @persons << teacher
    puts 'teacher added successfully'
  end

  def create_student
    puts 'Create new student'
    print 'Enter name: '
    name = gets.chomp
    print 'Enter Age: '
    age = gets.chomp.to_i
    puts 'Does the student have the permission? '
    parent_permission = gets.chomp
    parent_permission = parent_permission == 'y'
    print 'Enter classroom: '
    classroom = gets.chomp
    student = Student.new(name, age, parent_permission)
    @persons << student
    puts 'student added successfully'
  end

  def create_book
    puts 'Create new book'
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book added succesfully'
  end

  def list_all_books
    if @books.length.zero?
      puts 'No book found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title} Author: #{book.author}"
      end
    end
  end

  def list_all_person
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.role}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rentals
    puts 'Select a book from the following list by number'
    list_all_books
    book_chosen = gets.chomp.to_i
    book = @books[book_chosen]
    puts 'Select a book from the following list by number not (id)'
    list_all_person
    person_chosen = gets.chomp.to_i
    person = @persons[person_chosen]
    puts 'Enter Date: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental added successfully'
  end

  def list_all_rentals
    puts 'Enter ID of a person'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end
end
