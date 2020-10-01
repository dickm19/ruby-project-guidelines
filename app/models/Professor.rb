class Professor < ActiveRecord::Base
    belongs_to :course
    has_many :students, through: :course
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