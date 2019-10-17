

class StudentFinder

  def self.welcome
    puts "Welcome to Student Finder!"
  end

  def self.display_student(student)
    puts "Name: #{student.name}"
    puts "ID: #{student.id}"
    puts "Age: #{student.age}"
  end

  @@attempts = 1

  def self.find_student_by_age(age, found_students)
    found_student = found_students.find{|student| student.age == age.to_i}
    if found_student
      StudentFinder.display_student(found_student)
    elsif @@attempts < 5
      @@attempts += 1
      puts "You don't know how they is?! Get yo'self up outta here!"
      puts "Check * yo' * self! * Try again! How old they is?"
      next_try = gets.chomp
      StudentFinder.find_student_by_age(next_try, found_students)
    else
      puts "You betta run!"
    end
  end

  def self.find_student_by_name(student_name)
    found_student = Student.all.select{
      |student| student.name.downcase == student_name.downcase
    }
    if found_student.length == 1
      StudentFinder.display_student(found_student[0])
    elsif found_student.length > 1
      puts "We found mo than one #{student_name} - you betta be mo specific! *"
      puts "How old they is?"
      student_age = gets.chomp
      StudentFinder.find_student_by_age(student_age, found_student)
      #all the logic to find them from here
    else
      puts "Ain't * no * #{student_name} * here! *"
    end
  end

  def self.get_user_input
    puts "Who you want?" "*"
    response = gets.chomp
    # binding.pry
    StudentFinder.find_student_by_name(response)
    # binding.pry
  end


end
