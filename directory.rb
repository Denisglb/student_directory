#let's put all the students in an array

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do 
		# add the student has to the array
		students << {name: name, cohort: :november}
		puts "now we have #{students.count} students"
		# get another name for the user
		name =gets.chomp
	end
	students 
end

students = input_students

def print_header
	puts "The students of Villains Academy"
	puts "___________"
end
def print(students)
# iteration over the students, this will print all the students' names
	students.each_with_index do |student, index|
		if student[:name].length < 12 && student[:name].capitalize!.start_with?("S")
	puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
	end
end
end

def print_footer(names)
# finally, we print the total number of students
puts "Overall, we have #{names.count} great students"
end

print students
