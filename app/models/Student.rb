class Student < ActiveRecord::Base
    has_many :professor, through :courses
    has_many :spells
    belongs_to :school
    belongs_to :house
    
end