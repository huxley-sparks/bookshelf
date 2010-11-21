# Having an interface for student to checkout books
require './library_logic'

puts "Welcome"

puts "Here are the following options"
puts "\t1)New Student"
puts "\t2)Checkout book"
puts "\t3)Return book"
puts "\t4)Exit"

choice = gets.to_i
case choice
	when 1 
		puts "Please enter your name"
		student = gets
		new_student = Student.new(:name => student)
		new_student.save
	when 2
		puts "Please insert name"
		student = gets
		current_student = Student.where(:name => student).first
		puts "Please enter book to check out"
		book = gets
		current_student.books.create(:title => book)
		current_student.save
	when 3
		puts "Please imprima nombre"
		student = gets
		current_student = Student.where(:name => student).first
		puts "Please enter book returned"
		book = gets
		current_student.books.destroy(:title => book)
	else
		puts "invalid input"
end

