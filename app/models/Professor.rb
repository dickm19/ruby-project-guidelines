class Professor < ActiveRecord::Base
    has_many :students, through: :student_courses
    belongs_to :course
    belongs_to :school
    has_many :spells

    # def course
    #     Course.all.find do |course|
    #         if course.professor_id == self.id
    #             self.course = course
    #         end
    #     end
    # end
   
end