# Creating the logic for library_desk
require 'mongoid'

Mongoid::Config.instance.from_hash({"database" => "Library"})

class Student
	include Mongoid::Document
	field :name
	embeds_many :books

	def checked_out
		puts "Student has #{self.books.count} checked out"
	end

end

class Book
	include Mongoid::Document
	field :title
	field :pages, :type => Integer
	field :year, :type => Integer
	embedded_in :students, :inverse_of => :books

end
