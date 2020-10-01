class Student < ActiveRecord::Base
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :professors, through: :student_courses
    has_many :spells
    belongs_to :school
    belongs_to :house
    # - Student#add_course
    # - adds a course to the list of student courses
    def add_course(course)
        studentcourse = StudentCourse.create(student: self, course: course, professor: course.professor)
        
    end
    

    
end