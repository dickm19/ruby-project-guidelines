class School << ActiveRecord::Base
    has_many :students
    has_many :houses
    has_many :professors
    has_many :courses


end