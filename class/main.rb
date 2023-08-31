require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

neo = Student.new(25, 'Neo')
kasalivich = Student.new(42, 'Kasalivich')
john = Student.new(30, 'John')

ruby_class = Classroom.new('Ruby Class')
Classroom.new('React Class')

neo.classroom = ruby_class
kasalivich.classroom = ruby_class
ruby_class.add_student(john)

puts "We have #{ruby_class.students.length} students In #{ruby_class.label}:"
puts(ruby_class.students.map { |s| "- #{s.name}" })

toli = Person.new(21, 'Toli')
matdei = Person.new(37, 'Matdei')
kim = Person.new(29, 'Kim')
bil = Person.new(41, 'Bil')

reclaim_your_heart = Book.new('Reclaim Your Heart', 'Yasmin Mogahed')
the_road_to_mecca = Book.new('The Road to Mecca', 'Muhammad Asad')

reclaim_your_heart.add_rental(Date.today, toli)
reclaim_your_heart.add_rental(Date.today, matdei)

the_road_to_mecca.add_rental(Date.today, kim)
the_road_to_mecca.add_rental(Date.today, bil)

puts "\n"

puts "Book '#{reclaim_your_heart.title}' have #{reclaim_your_heart.rentals.length} rentals:"
puts(reclaim_your_heart.rentals.map { |r| "-#{r.person.name} at #{r.date}" })

puts "\n"

puts "Book '#{the_road_to_mecca.title}' have #{the_road_to_mecca.rentals.length} rentals:"
puts(the_road_to_mecca.rentals.map { |r| "-#{r.person.name} at #{r.date} " })
