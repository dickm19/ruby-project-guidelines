class Spell << ActiveRecord::Base
    belongs_to :students
    belongs_to :courses

end