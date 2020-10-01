require_relative '../config/environment'
require 'pry'

House.destroy_all
Student.destroy_all
Professor.destroy_all
Course.destroy_all
Spell.destroy_all
School.destroy_all
#binding.pry

# hogwarts = School.create(name: "Hogwarts")

# #houses
# gryffindor = House.create(name: "Gryffindor", school_id: hogwarts.id)
# hufflepuff = House.create(name: "Hufflepuff", school_id: hogwarts.id)
# ravenclaw = House.create(name: "Ravenclaw", school_id: hogwarts.id)
# slytherin = House.create(name: "Slytherin", school_id: hogwarts.id)

# #students
# mary = Student.create(name: "Mary", school_id: hogwarts.id, house: House.all.sample)
# david = Student.create(name: "David", school_id: hogwarts.id, house: House.all.sample)
# dude = Student.create(name: "Dude", school_id: hogwarts.id, house: House.all.sample)
# guy = Student.create(name: "Guy", school_id: hogwarts.id, house: House.all.sample)
# harry = Student.create(name: "Harry Potter", school_id: hogwarts.id, house: House.all.sample)
# ron = Student.create(name: "Ron", school_id: hogwarts.id, house: House.all.sample)
# hermione = Student.create(name: "Hermione", school_id: hogwarts.id, house: House.all.sample)

# #courses
# dada = Course.create(name: "Defense Aganst the Dark Arts", school_id: hogwarts.id)
# transfiguration = Course.create(name: "Transfiguration", school_id: hogwarts.id)
# divination = Course.create(name: "Divination", school_id: hogwarts.id)
# creatures = Course.create(name: "Care of Magical Creatures", school_id: hogwarts.id)
# herbology = Course.create(name: "Herbology", school_id: hogwarts.id)



# #professors
# minerva = Professor.create(name: "Professorr McGonagall", course_id: transfiguration.id, school_id: hogwarts.id)
# trelawny = Professor.create(name: "professorr Trelawny", course_id: divination.id, school_id: hogwarts.id)
# neville = Professor.create(name: "Professior Longbottom", course_id: herbology.id, school_id: hogwarts.id)
# hagrid = Professor.create(name: "Professorr Hagrid", course_id: creatures.id, school_id: hogwarts.id)
# lupin = Professor.create(name: "Professor Lupin", course_id: dada.id, school_id: hogwarts.id)



