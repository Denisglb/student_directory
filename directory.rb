#let's put all the students in an array

students = [
	"Dr. Hannibal Lecter",
	"Darth Vader",
	"Nurse Ratched",
	"Michael Corleone",
	"Alex DeLarge",
	"The Wicked Witch of the West",
	"Terminator",
	"Freddy Krueger",
	"The Joker",
	"Joffrey Baratheon",
	"Norman Bates"
]

def print_header
	puts "The students of Villains Academy"
	puts "___________"
end
def print(names)
# iteration over the students, this will print all the students' names
students.each do |student|
	puts student
end
end

def print_footer(names)
# finally, we print the total number of students
puts "Overall, we have #{names.count} great students"
end
