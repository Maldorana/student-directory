@students = []

def interactive_menu
  while true do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    # input the students
    input_students
  when "2"
    # show the students
    show_students
  when "3"
    # save the students
    save_students
  when "4"
    # load the students
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Try again."
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "-------------"
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  if !@students.empty?
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "No students"
  end
end

def print_footer
  puts "-------------"
  puts "Overall, we have #{@students.count} great students"
  puts "-------------"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    student_string = student_data.join(",")
    file.puts student_string
  end
  file.close
  puts "Students saved"
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort:   cohort.to_sym}
  end
  file.close
  puts "Students loaded"
end

interactive_menu