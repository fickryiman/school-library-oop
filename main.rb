require_relative 'app'
require 'json'
def menu_display
  puts "\n"
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Quit'
end
def options(app, choice)
  case choice
  when 1
    app.list_books
  when 2
    app.list_persons
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals_by_person_id
  end
end
def start
  puts "\nWelcome to School Library App! \n"
  # load data from json files and parse it to the app
  books = load_book_data
  persons = load_person_data
  rentals = load_rental_data(persons, books)
  app = App.new(books, persons, rentals)
  loop do
    menu_display
    user_input = gets.chomp.to_i
    puts 'Invalid Input! Please choose the correct number.' if user_input < 1
    if user_input >= 7
      # data will be store
      app.store_data_to_json_files
      puts "\n"
      puts 'Thank you for using this app!'
      break
    end
    options(app, user_input)
  end
end
def load_book_data
  books = []
  json_books = './data/books.json'
  if File.exist?(json_books) && !File.empty?(json_books)
    books_data = JSON.parse(File.read(json_books))
    books_data.each do |x|
      book = Book.new(x['title'], x['author'])
      books << book
    end
  end
  books
end
def load_person_data
  persons = []
  json_persons = './data/persons.json'
  if File.exist?(json_persons) && !File.empty?(json_persons)
    persons_data = JSON.parse(File.read(json_persons))
    persons_data.map do |person|
      if person['type'] == 'Student'
        student = Student.new(person['age'], parent_permission: person['parent_permission'], name: person['name'])
        persons << student
      else
        teacher = Teacher.new(person['age'], person['specialization'], name: person['name'])
        persons << teacher
      end
    end
  end
  persons
end
def load_rental_data(persons, books)
  all_rentals = []
  json_rentals = './data/rentals.json'
  if File.exist?(json_rentals) && !File.empty?(json_rentals)
    rentals_data = JSON.parse(File.read(json_rentals))
    rentals_data.each do |rent|
      date = rent['date']
      person = persons[rent['person_index']]
      book = books[rent['book_index']]
      rental = Rental.new(date, person, book)
      all_rentals << rental
    end
  end
  all_rentals
end
start