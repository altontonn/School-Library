require './book'
require './rental'
require './classroom'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @book = []
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
      options input
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
    teacher = Teacher.new(specialization, age, name)
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
    student = Student.new(name, age, parent_permission, classroom)
    @persons << student
    puts 'student added successfully'
  end
end
