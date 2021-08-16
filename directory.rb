# input students

def input_students
  students = []

  puts "Please enter a student name"
  puts "Hit enter twice to finish"
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "We now have #{students.count} student(s). Next student name? (Hit enter twice to finish)"
    name = gets.chomp
  end

  students
end

# Define methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Call methods

students = input_students
print_header
print(students)
print_footer(students)