require_relative 'class/book'
require_relative 'class/person'
require_relative 'class/teacher'
require_relative 'class/student'
require_relative 'class/rental'

class App
  def initialize()
    @persons = []
    @books = []
    @rentals = []
    @title = ''
    @author = ''
    @name = ''
    @age = ''
    @parent_permission = false
    @specialization = ''
  end

  # list all book
  def list_books
    @books.each do |b|
      print_book(b)
    end
  end

  # print book
  def print_book(book)
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end

  # list all person
  def list_persons
    puts 'No person found! Please create a person.' if @persons.empty?
    @persons.each do |p|
      print_person(p)
    end
  end

  # print person
  def print_person(person)
    puts "[#{person.class.name}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  # create a person
  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    input_result = gets.chomp

    case input_result
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid Input!'
    end
  end

  # create a person - student
  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    permission = choose_parent_permission

    student = Student.new(age, name, parent_permission: permission)
    @persons << student
    puts 'Person created successfully'
  end

  # choose parent permission
  def choose_parent_permission
    print 'has parent granted the permission? [Y/N]: '
    permission = gets.chomp.downcase

    case permission
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Input!'
      choose_parent_permission
    end
  end

  # create a person - teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    puts 'Person created successfully'
  end

  # create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  # create a rental
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |b, i|
      print "#{i}). "
      print_book(b)
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by the number (is not the id number)'
    @persons.each_with_index do |p, i|
      print "#{i}). "
      print_person(p)
    end

    person_index = gets.chomp.to_i

    date = Date.today
    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts date
    puts 'Rental created successfully'
  end

  # List all rentals for a given person id
  def list_rentals_by_person_id
    print 'Please enter a person ID:'
    person_id = gets.chomp.to_i

    person = @persons.find { |p| p.id == person_id }
    rentals = @rentals.select { |r| r.person == person }
    puts 'Rentals'
    rentals.each do |r|
      puts "Date: #{r.date}, Book: #{r.book.title} by #{r.book.author}"
    end
  end
end
