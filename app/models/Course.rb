class Course << ActiveRecord::Base
    has_many :students
    belongs_to :professor
    has_many :spells

end