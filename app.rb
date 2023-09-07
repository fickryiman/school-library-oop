require_relative 'class/book'
require_relative 'class/person'
require_relative 'class/teacher'
require_relative 'class/student'
require_relative 'class/rental'
require 'date'

class App
  attr_accessor :books, :persons, :rentals

  def initialize(books_data, persons_data, rentals_data)
    @books = books_data
    @persons = persons_data
    @rentals = rentals_data
  end

  def list_books
    puts "\nNo book found! Please create a book." if @books.empty?
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_persons
    puts "\nNo person found! Please create a person." if @persons.empty?
    @persons.each do |p|
      person_type = p.class.name
      print "[#{p.class.name}] - ID: #{p.id}, Name: #{p.name}, "
      if person_type == 'Student'
        puts "Age: #{p.age}, Parent Permission: #{p.parent_permission}"
      else
        puts "Age: #{p.age}, Specialization: #{p.specialization}"
      end
    end
  end

  def create_person
    print "\nDo you want to create a student(1) or a teacher(2)? [Input the number]: "
    user_input = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case user_input
    when '1'
      permission = choose_parent_permission
      create_student(age, name, permission)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid Input!'
    end
  end

  def choose_parent_permission
    print 'has parent granted the permission? [Y/N]: '
    permission = gets.chomp.downcase
    case permission
    when 'y'
      permission = true
    when 'n'
      permission = false
    else
      puts 'Invalid Input!'
      choose_parent_permission
    end
    permission
  end

  def create_student(age, name, permission)
    student = Student.new(age, parent_permission: permission, name: name)
    @persons << student
    puts "\nPerson (Student) created successfully"
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name: name)
    @persons << teacher
    puts "\nPerson (Teacher) created successfully"
  end

  def create_book
    print 'Book Title: '
    book_title = gets.chomp
    print 'Book Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books << book
    puts 'Book has successfully created'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}). Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    selected_book = @books[book_index]
    puts 'Select a person from the following list by the number (not the ID number)'
    @persons.each_with_index do |person, index|
      puts "#{index}). Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    selected_person = @persons[person_index]
    date = Date.today
    rental = Rental.new(date, selected_person, selected_book)
    @rentals << rental
    puts "\nBook Rent has successfully created at #{date}"
  end

  # List all rentals for a given person id
  def list_rentals_by_person_id
    if @rentals.empty?
      puts "\nNo rental data found! Please create a rental."
      return
    end

    print 'Please enter a person ID: '
    input_person_id = gets.chomp.to_i
    person = @persons.find { |p| p.id == input_person_id }
    rentals = @rentals.select { |rent| rent.person == person }
    puts "Books Rent for ID \"#{input_person_id}\" is: "
    rentals.each do |rent|
      puts "Date: #{rent.date}, Book: \"#{rent.book.title}\" by #{rent.book.author}"
    end
  end

  def save_books_data
    json_books = 'data/books.json'
    data = @books.map do |book|
      { title: book.title, author: book.author, rentals: book.rentals }
    end
    file = File.open(json_books, 'w')
    file.puts(data.to_json)
    file.close
  end

  def save_persons_data
    json_persons = 'data/persons.json'
    data = @persons.map do |person|
      if person.instance_of? Student
        { name: person.name, age: person.age, type: 'Student', parent_permission: person.parent_permission }
      else
        { name: person.name, age: person.age, type: 'Teacher', specialization: person.specialization }
      end
    end
    file = File.open(json_persons, 'w')
    file.puts(data.to_json)
    file.close
  end

  def save_rentals_data
    json_rentals = 'data/rentals.json'
    data = @rentals.map do |rent|
      {
        date: rent.date,
        person_index: @persons.find_index(rent.person),
        book_index: @books.find_index(rent.book)
      }
    end
    file = File.open(json_rentals, 'w')
    file.puts(data.to_json)
    file.close
  end

  def store_data_to_json_files
    save_books_data
    save_persons_data
    save_rentals_data
  end
end
