class Professor < ActiveRecord::Base
    has_many :students, through :courses
    belongs_to :school
    has_many :spells


end