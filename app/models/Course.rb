class Course < ActiveRecord::Base
    has_many :student_courses
    has_many :students, through: :student_courses
    belongs_to :professor
    belongs_to :school
    has_many :spells


end