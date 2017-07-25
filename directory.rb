#let's put all the students in an array

def input_students
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	# create an empty array
	students = []
	# get the first name
	# name = gets.chomp
	name = gets.gsub(/\n/, "")
	
	puts "Enter the cohort".center(50)
	cohort = gets.gsub(/\n/,"")

	puts "Please add a country of birth for the student".center(50)
	# birth_place = gets.chomp
	birth_place = gets.gsub(/\n/,"")
	
	puts "Please add the height of the student in cm".center(50)
	# height = gets.chomp
	height = gets.gsub(/\n/, "")
	
	puts "Please add a hobbie for the student".center(50)
	# hobbie = gets.chomp
	hobbie = gets.gsub(/\n/, "")
	
	# while the name is not empty, repeat this code
	while !name.empty? do 
		if cohort == ""
			cohort = :November
		end
		# add the student has to the array
		students << {name: name, cohort: cohort.to_sym, country: birth_place, height: height, hobbie: hobbie}
		if students.count == 1
			puts "now we have #{students.count} student".center(50)
		else 
			puts "now we have #{students.count} students".center(50)
		end
		# get another name for the user
		puts "Please enter the next students' name or press enter to quite".center(50)
		name = gets.chomp
		break if name == ""
		puts "Enter the cohort".center(50)
		cohort = gets.gsub(/\n/,"")
		puts "Please add a country of birth for the student".center(50)
		birth_place = gets.chomp

		puts "Please add the height of the student in cm".center(50)
		height = gets.chomp

		puts "Please add a hobbie for the student".center(50)
		hobbie = gets.chomp
	end
	students 
end

def print_header
	line_width = 50
	puts "The students of Villains Academy"
	puts "___________"
	puts ("Index").ljust(line_width/6) + ("Name").ljust(line_width*2/6) + ("Cohort").ljust(line_width/2) + ("Country of Origin").ljust(line_width*4/6) + ("Height (cm)").ljust(line_width*5/6) + ("Favourite Hobbies").ljust(line_width/6)
end

def print(students)
# iteration over the students, this will print all the students' names
		if students.count <= 0 
			return
		end
		line_width = 50
		students.each_with_index do |student, index|
			cohort_of_your_choice = :November
			if student[:cohort] == cohort_of_your_choice
				puts ("#{student[:name]}").ljust(line_width/6) + ("#{student[:cohort]}").ljust(line_width*2/6)
	puts ("#{index+1}.").ljust(line_width/6) + ("#{student[:name]}").ljust(line_width*2/6) + ("#{student[:cohort]}").ljust(line_width/2) + ("#{student[:country]}").ljust(line_width*4/6) + ("#{student[:height]}cm").ljust(line_width*5/6) + ("#{student[:hobbie]}").ljust(line_width/6)
		end
	end
end

def print_footer(names)
# finally, we print the total number of students
puts "Overall, we have #{names.count} great students"
end

def interactive_menu
	students = []
	# declared the variable students before the loop setting it to an empty array. Done so that it will be availble in several iterations of the loop. 
	loop do 
		# 1. print the menu and ask the user what to do
		puts '1. Input the students'
		puts "2. Show the stuedents"
		puts "9. Exit" 

		selection = gets.chomp
		# read the input and save it to selection

		case selection
		when "1"
			students = input_students
		when "2"
			print_header
			print students
			print_footer students
		when "9"
			exit 
			# This will cause the programme to terminate
		else
			puts "I don't know what you mean, try again"
		end
	end
end

interactive_menu
