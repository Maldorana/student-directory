# input students

def input_students
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  while true do
    puts "Please enter a student name (leave blank to finish)"
    name = gets.chomp
    return students if name.empty?
    puts "Please enter this student's cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = :November
    elsif !months.include?(cohort.capitalize)
      puts "That's not a month. Reverting to default value."
      cohort = :November
    else
      cohort.capitalize.to_sym
    end
 
     students << {name: name, cohort: cohort}
    if students.count == 1
      puts "We now have #{students.count} student."
    elsif students.count > 1
      puts "We now have #{students.count} students."
    end
  end

  students
end

# Output Students

def print_header
  puts "----------------------------".center(50, "-")
  puts " The students of Villains Academy ".center(50, "-")
  puts "----------------------------".center(50, "-")
end

def print(students)
  cohorts = []

  students.each { |student| cohorts << student[:cohort].to_s.capitalize if !cohorts.include?(student[:cohort].to_s.capitalize) }
  
  cohorts.each do |cohort|
    puts cohort.upcase.center(50, "-")
    students.each do |student|
      puts student[:name].center(50) if student[:cohort].to_s.capitalize == cohort
    end
  end
end

def print_footer(students)
  puts "-".center(50, "-")
  puts "Overall, we have #{students.count} great students".center(50)
  puts "-".center(50, "-")
end

# Call methods

students = input_students
print_header
print(students)
print_footer(students)
