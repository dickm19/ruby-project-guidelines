class School < ActiveRecord::Base
    has_many :students
    has_many :houses
    has_many :professors
    has_many :courses

    def award_points(student, house, points)
        if house.points == nil && student.house == house
            house.points = points
            student.house.points = points
        else
            student.house.points += points
            # house.points += points
        end
    end

end