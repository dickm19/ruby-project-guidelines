class Student < ActiveRecord::Base
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :professors, through: :courses
    has_many :spells, through: :courses
    belongs_to :school
    belongs_to :house

    # - Student#add_course
    # - adds a course to the list of student courses
    def add_course(course)
        studentcourse = StudentCourse.create(student: self, course: course)
    end
    
    ## student#practice_spell(spell) takes in a spell and changes its status to mastered, 
    ## returns "you have mastered spell_name!", and awards the student's house 50 points
    def practice_spell(new_spell)
        self.spells.each do |spell|
            if new_spell == spell
                if spell.status == "mastered"
                    $stdout.flush
                    sleep(2)
                    puts " "
                    puts spell.description
                    $stdout.flush
                    sleep(3)
                    puts " "
                    puts "You've already mastered #{new_spell.name}."
                    $stdout.flush
                    sleep(1)
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
                    sleep(2)
                    puts " "
                    puts spell.description
                    $stdout.flush
                    sleep(3)
                    puts " "
                    spell.status = "mastered"
                    puts "Congratulations, you have mastered the #{spell.name}!"
                    $stdout.flush
                    sleep(1)
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
                end
            end
        end
    end

    def mastered_spells
        #binding.pry
        mastered_spells = self.spells.select {|spell| spell.status == "mastered"}
        spell_names = mastered_spells.map {|spell| spell.name}
        
        
    end

    def view_courses
        puts " "
        puts "Courses:".green
        self.courses.map do |course|
            puts "Course: #{course.name}"
        end
    end
    
    def view_professors
        puts " "
        puts "Your Professors:".yellow
        self.professors.map {|professor| puts "#{professor.name}: #{professor.course.name}" }
    end



    
end