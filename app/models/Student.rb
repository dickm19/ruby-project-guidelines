class Student < ActiveRecord::Base
    has_many :professor, through: :courses
    has_many :spells
    belongs_to :school
    belongs_to :house

    # - Student#add_course
    # - adds a course to the list of student courses
    # def add_course(course)
        
    # end
    
    
end