#let's put all the students in an array

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	puts "Please add a country of birth for the student"
	birth_place = gets.chomp

	puts "Please add the height of the student in cm"
	height = gets.chomp

	puts "Please add a hobbie for the student"
	hobbie = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do 
		# add the student has to the array
		students << {name: name, cohort: :november, country: birth_place, height: height, hobbie: hobbie}
		puts "now we have #{students.count} students"
		# get another name for the user
		puts "Please enter the next students' name or press enter to quite"
		name = gets.chomp
		break if name == ""
		puts "Please add a country of birth for the student"
		birth_place = gets.chomp

		puts "Please add the height of the student in cm"
		height = gets.chomp

		puts "Please add a hobbie for the student"
		hobbie = gets.chomp
	end
	students 
end

students = input_students

def print_header
	line_width = 50
	puts "The students of Villains Academy"
	puts "___________"
	puts ("Index").ljust(line_width/6) + ("Name").ljust(line_width*2/6) + ("Cohort").ljust(line_width/2) + ("Country of Origin").ljust(line_width*4/6) + ("Height (cm)").ljust(line_width*5/6) + ("Favourite Hobbies").ljust(line_width/6)
end
def print(students)
# iteration over the students, this will print all the students' names
		line_width = 50
		students.each_with_index do |student, index|
		
	puts ("#{index+1}.").ljust(line_width/6) + ("#{student[:name]}").ljust(line_width*2/6) + ("#{student[:cohort]}").ljust(line_width/2) + ("#{student[:country]}").ljust(line_width*4/6) + ("#{student[:height]}cm").ljust(line_width*5/6) + ("#{student[:hobbie]}").ljust(line_width/6)
		end
end

def print_footer(names)
# finally, we print the total number of students
puts "Overall, we have #{names.count} great students"
end

print_header
print students
print_footer students


