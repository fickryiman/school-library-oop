require_relative 'app'
def start
  app = App.new
  puts "Welcome to School Library App! \n\n"
  loop do
    menu_display
    option = gets.chomp.to_i
    puts 'Thank you for using this app!' if option == 7
    options(app, option)
  end
end

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
  option = {
    1 => :list_books,
    2 => :list_persons,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_by_person_id,
    7 => :exit
  }
  action = option[choice]
  if action
    app.send(action)
  else
    puts 'Invalid input! Please try again.'
  end
end
start
