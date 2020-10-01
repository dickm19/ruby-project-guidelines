require_relative '../../config/environment'
require "tty-prompt"
require 'pry'


class CLI
    def welcome
        hogwarts = School.create(name: "Hogwarts")
        puts "Welcome to Hogwarts School of Witchcraft and Wizardry."
        $stdout.flush
        sleep(1)
        puts " "

        puts "Before we get started you will have to be sorted into your house."
        $stdout.flush
        sleep(1)
        puts " "

        puts "The houses are:"
        $stdout.flush
        sleep(1)
        puts " "

        puts "Gryffindor".red
        $stdout.flush
        sleep(1)

        puts "Ravenclaw".blue
        $stdout.flush
        sleep(1)

        puts "Hufflepuff".yellow
        $stdout.flush

        puts "and"
        $stdout.flush
        sleep(1)

        puts "Slytherin".green
        $stdout.flush
        sleep(1)
        puts " "
    end

    def sorting_hat(student)
        puts "Now the sorting will begin!"
        $stdout.flush
        sleep(1)
        puts "Your house is"
        $stdout.flush
        sleep(3)
        if student.house.name == "Gryffindor"
            puts "GRYFFINDOR!!".red
        elsif student.house.name == "Ravenclaw"
            puts "RAVENCLAW!!".blue
        elsif student.house.name == "Hufflepuff"
            puts "HUFFLEPUFF!!".yellow
        elsif student.house.name == "Slytherin"
            puts "SLYTHERIN!!".green
        end
    end

    def get_student_name(school)
        name = gets.chomp
        Student.create(name: name, school_id: school.id, house: House.all.sample)
    end
    
    def select_courses(student,courses)
        prompt = TTY::Prompt.new
        count = 1
        while count <= 3 do
            selection = prompt.select("Please select your courses for this term (#{count}/3)", courses)
            selection_course = Course.find_by_name(selection)
            if !student.courses.include?(selection_course)
                student.add_course(selection_course)
            else
                puts "#{selection} is already on your schedule."
                count -= 1
            end
            count += 1
        end
        puts " "
    end

    def view_courses(student)
        courses = student.courses.map {|course| course.name}
        puts "Your courses are:"
        puts "1) #{courses[0]}"
        puts "2) #{courses[1]}"
        puts "3) #{courses[2]}"
        puts " "
    end

    def view_professors(student)
        professors = student.professors.map {|professor| professor.name}
        courses = student.courses.map {|course| course.name}
        puts "Your professors are:"
        puts "#{professors[0]}: '#{courses[0]}'"
        puts "#{professors[1]}: '#{courses[1]}'"
        puts "#{professors[2]}: '#{courses[2]}'"
        puts " "
    end

    




end