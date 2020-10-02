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
        patronus_animals = ["rabbit", "unicorn", "spider", "dog", "cat", "stag", "rat", "mouse", "ferret", "moose", "duck", "eagle", "dragon", "snake", "stork", "manatee", "cow", "turtle"]
        Student.create(name: name, school_id: school.id, house: House.all.sample, patronus: patronus_animals.sample)
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
        system "clear"
        prompt = TTY::Prompt.new
        choices = ["Go to a class", "Practice a Spell or Potion", "View Courses", "View mastered Spells/Potions", "View Professors", "Play a game of Wizard's Chess", "Check House Points", "End"]

        courses = student.courses.map {|course| course.name}
        spells = student.spells.map {|spell| spell.name}
        dada = Course.find_by_name("Defense Against the Dark Arts")
        spells << Spell.create(name: "Patronus Charm (Expecto Patronum)", description: "Produces a silver, animal guardian, used to protect a witch or wizard against Dementors", course: dada, status: "unmastered").name
        choice = prompt.select("What would you like to do?", choices)
        if choice == "Go to a class"
            course_select = prompt.select("What class would you like to go to?", courses)
            puts " "
            course_in = Course.find_by_name(course_select)
            if course_select == "Defense Against the Dark Arts"
                puts "You spend the day learning about Boggarts!"
                $stdout.flush
                sleep(1)
                student.practice_spell(course_in.spells[0])
                $stdout.flush
                sleep(1)
                puts " "
            elsif course_select == "Transfiguration"
                puts "You learned how to magically repair broken objects!"
                $stdout.flush
                sleep(1)
                student.practice_spell(course_in.spells[0])
                $stdout.flush
                sleep(1)
                puts " "
            elsif course_select == "Potions"
                puts "You learned how to brew liquid luck! Better go buy a lottery ticket!"
                $stdout.flush
                sleep(1)
                student.practice_spell(course_in.spells[0])
                $stdout.flush
                sleep(1)
                puts " "
            elsif course_select == "Charms"
                puts "You learned how to magically make objects levitate!"
                $stdout.flush
                sleep(1)
                student.practice_spell(course_in.spells[0])
                $stdout.flush
                sleep(1)
                puts " "
            end
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
        elsif choice == "Practice a Spell or Potion"
            spell_select = prompt.select("What spell/potion would you like to practice?", spells)
            puts " "
            spell_selection = Spell.find_by_name(spell_select)
            #binding.pry
            if spell_select == "Patronus Charm (Expecto Patronum)"
                if spell_selection.status == "mastered"
                    $stdout.flush
                    sleep(1)
                    puts "You feel a sense of calm warmth as a silver #{student.patronus} seeps out of your wand."
                    puts " "
                    puts "Fifty points to #{self.house.name}!"
                    self.school.award_points(self, self.house, 50)
                    $stdout.flush
                    sleep(1)
                    puts " "
                    puts "#{self.house.name} now has #{self.house.points} points!"
                    $stdout.flush
                    sleep(2)
                    puts " "
                else
                    $stdout.flush
                    sleep(1)
                    puts "You feel a sense of calm warmth as a silver #{student.patronus} seeps out of your wand."
                    spell_selection.status = "mastered"
                    $stdout.flush
                    sleep(1)
                    puts " "
                    puts "Congratulations, you have mastered #{spell_selection.name}!"
                    $stdout.flush
                    sleep(1)
                    puts " "

                    puts "Fifty points to #{student.house.name}!"
                    student.school.award_points(student, student.house, 50)
                    $stdout.flush
                    sleep(1)
                    puts " "
                    puts "#{student.house.name} now has #{student.house.points} points!"
                end
                prompt.ask('Press "Enter" to continue', echo: false)
                choices(student)
            else
                student.practice_spell(spell_selection)
            end
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
            
        elsif choice == "View Courses"
            student.view_courses
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
        elsif choice == "View mastered Spells/Potions"
            #binding.pry
            puts " "
            #binding.pry
            if student.mastered_spells == []
                puts 'You have no mastered spells or potions, to master a spell or potion, you must practice it first'
            else
                puts "Your Mastered Spells/Potions:".green
                puts student.mastered_spells
            end
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
        elsif choice == "View Professors"
            student.view_professors
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)    
        elsif choice == "Play a game of Wizard's Chess"
            win_lose = ["win".green, "lose".red]
            puts " "
            puts "You play a game of Wizard's chess and #{win_lose.sample}!"
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
        elsif choice == "Check House Points"
            puts " "
            if student.house.points == nil
                puts " "
                puts "#{student.house.name} currently has no points! Master spells and potions to gain points for your house."
            else
                puts " "
                puts "#{student.house.name} currently has #{student.house.points} points!"
            end
            puts " "
            prompt.ask('Press "Enter" to continue', echo: false)
            choices(student)
        elsif choice == "End"
            puts " "
            puts "Thank you for attending Hogwarts School of Witchcraft and Wizardry.".red
            puts " "
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