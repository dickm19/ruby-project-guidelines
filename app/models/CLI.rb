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

    def choices(student)
        prompt = TTY::Prompt.new
        choices = ["Go to a class", "Practice a Spell or Potion", "View Courses", "View mastered Spells/Potions", "View Professors", "Play a game of Wizard's Chess"]
        choice = prompt.select("What would you like to do?", choices)
        courses = student.courses.map {|course| course.name}
        spells = student.spells.map {|spell| spell.name}
        #binding.pry
        if choice == "Go to a class"
            course_select = prompt.select("What class would you like to go to?", courses)
            puts " "
            if course_select == courses[0]
                puts "You spend the day learning about Boggarts!"
                student.practice_spell(student.courses[0].spells[0])
                puts " "
            elsif course_select == courses[1]
                puts "You learned how to magically repair broken objects!"
                student.practice_spell(student.courses[1].spells[0])
                puts " "
            elsif course_select == courses[2]
                puts "You learned how to brew liquid luck! Better go buy a lottery ticket!"
                student.practice_spell(student.courses[2].spells[0])
                puts " "
            elsif course_select == courses[3]
                puts "You learned how to magically make objects levitate!"
                student.practice_spell(student.courses[3].spells[0])
                puts " "
            end
            choices(student)
        elsif choice == "Practice a Spell or Potion"
            spell_select = prompt.select("What spell/potion would you like to practice?", spells)
            spell_selection = Spell.find_by_name(spell_select)
            student.practice_spell(spell_selection)
            puts " "
            choices(student)
            
        elsif choice == "View Courses"
            student.view_courses
            puts " "
            choices(student)
        elsif choice == "View mastered Spells/Potions"
            student.mastered_spells
            puts " "
            choices(student)
        elsif choice == "View Professors"
            student.view_professors
            puts " "
            choices(student)    
        elsif choice == "Play a game of Wizard's Chess"
            win_lose = ["win", "lose"]
            puts "You play a game of Wizard's chess and #{win_lose.sample}!"
            choices(student)
        end
    end

    




end

# elsif choice == "Go to Dormitory"
        #     q = ""
        #     password_options = ["Caput Draconis", "A circle has no beginning.", "*wand taps*", "Pure-blood"]
        #     if student.house.name == "Gryffindor"
        #         q = "PaAaAasswoOoOrd??"
        #         password = password_options[0]
        #     elsif student.house.name == "Ravenclaw"
        #         q = "Which came first, the phoenix or the flame?"
        #         password = password_options[1]
        #     elsif student.house.name == "Hufflepuff"
        #         q = "Password?"
        #         password = password_options[2]
        #     elsif student.house.name == "Slytherin"
        #         q = "Password?"
        #         password = password_options[3]
        #     end
        #     password_choice = ""
        #     while password_choice != password do
        #         password_choice = prompt.select(q, password_options)
        #         if password_choice == password
        #             puts "You may pass"
        #             break
        #         else
        #             puts "WRONG"
        #         end
        #     end