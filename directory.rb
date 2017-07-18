#let's put all the students in an array

students = [
	{name: "Dr. Hannibal Lecter",cohort: :november},
	{name: "Darth Vader", cohort: :november},
	{name: "Nurse Ratched", cohort: :november},
	{name: "Michael Corleone", cohort: :november},
	{name: "Alex DeLarge", cohort: :november},
	{name: "The Wicked Witch of the West", cohort: :november},
	{name: "Terminator", cohort: :november},
	{name: "Freddy Krueger", cohort: :november},
	{name: "The Joker", cohort: :november},
	{name: "Joffrey Baratheon", cohort: :november},
	{name: "Norman Bates", cohort: :november}
]

def print_header
	puts "The students of Villains Academy"
	puts "___________"
end
def print(students)
# iteration over the students, this will print all the students' names
students.each do |student|
	puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer(names)
# finally, we print the total number of students
puts "Overall, we have #{names.count} great students"
end
