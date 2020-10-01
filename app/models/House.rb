class House < ActiveRecord::Base
    has_many :students
    belongs_to :school

   

    
end