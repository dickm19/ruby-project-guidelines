class Professor < ActiveRecord::Base
    has_many :students, through :course
    belongs_to :school
    has_many :spells


end