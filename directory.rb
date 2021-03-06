#let's put all the students in an array
@students = [] 
# We need to access the variable students across numerous variables. 
# an empty array accessible to all methods

def add_students(name, cohort, country, height, hobbie)
	@students << {name: name, cohort: cohort.to_sym, country: country.to_sym, height: height.to_sym, hobbie: hobbie.to_sym }
end

def interactive_menu
	# declared the variable students before the loop setting it to an empty array. Done so that it will be availble in several iterations of the loop. 
	loop do 
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list of students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process (selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit
		else 
			puts "I dont know what you mean, try again"
	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# open method returns us a  reference to the file that we can save it a variable.
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:country], student [:height], student [:hobbie]]
		csv_line = student_data.join(',')
		file.puts csv_line
	end
	file.close
	# every time a file is opened it needs to be closed
end

def load_students(filename = "students.csv")
	file = File.open(filename,"r")
	file.readlines.each do |line|
		name, cohort, country, height, hobbie = line.chomp.split(',')
		add_students(name, cohort, country, height, hobbie)
	end
	file.close
end

def try_load_students
	filename = 	ARGV.first #first argument from the command line
	return if filename.nil? #get out od the method if it isn'ts given
	if File.exist?(filename) #if it exists
		load_students(filename)
		puts "loaded #{@students.count} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit #quit the program
	end
end

def input_students
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	# create an empty array
	students = []
	# get the first name
	# name = gets.chomp
	name = STDIN.gets.chomp
	
	puts "Enter the cohort".center(50)
	cohort = STDIN.gets.chomp

	puts "Please add a country of birth for the student".center(50)
	# birth_place = gets.chomp
	country = STDIN.gets.chomp
	
	puts "Please add the height of the student in cm".center(50)
	# height = gets.chomp
	height = STDIN.gets.chomp
	
	puts "Please add a hobbie for the student".center(50)
	# hobbie = gets.chomp
	hobbie = STDIN.gets.chomp
	
	# while the name is not empty, repeat this code
	while !name.empty? do 
		if cohort == ""
			cohort = :November
		end
		# add the student has to the array
		add_students(name, cohort, country, height, hobbie)
		if @students.count == 1
			puts "now we have #{@students.count} student".center(50)
		else 
			puts "now we have #{@students.count} students".center(50)
		end
		# get another name for the user
		puts "Please enter the next students' name or press enter to quite".center(50)
		name = STDIN.gets.chomp
		break if name == ""
		puts "Enter the cohort".center(50)
		cohort = STDIN.gets.chomp
		puts "Please add a country of birth for the student".center(50)
		country = STDIN.gets.chomp

		puts "Please add the height of the student in cm".center(50)
		height = STDIN.gets.chomp

		puts "Please add a hobbie for the student".center(50)
		hobbie = STDIN.gets.chomp
	end
	@students 
end

def print_header
	line_width = 50
	puts "The students of Villains Academy"
	puts "___________"
	puts ("Index").ljust(line_width/6) + ("Name").ljust(line_width*2/6) + ("Cohort").ljust(line_width/2) + ("Country of Origin").ljust(line_width*4/6) + ("Height (cm)").ljust(line_width*5/6) + ("Favourite Hobbies").ljust(line_width/6)
end

def print_students_list
# iteration over the students, this will print all the students' names
		if @students.count <= 0 
			return
		end
		line_width = 50
		@students.each_with_index do |student, index|
	puts ("#{index+1}.").ljust(line_width/6) + ("#{student[:name]}").ljust(line_width*2/6) + ("#{student[:cohort]}").ljust(line_width/2) + ("#{student[:country]}").ljust(line_width*4/6) + ("#{student[:height]}cm").ljust(line_width*5/6) + ("#{student[:hobbie]}").ljust(line_width/6)
		end
end

def print_footer
# finally, we print the total number of students
if @students.count <= 0
	return
end

if @students.count == 1 
	puts "Overall, we have one great student! The rest are imaginary"
else
puts "Overall, we have #{@students.count} great students"
end
end


interactive_menu
