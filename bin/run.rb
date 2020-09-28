require_relative '../config/environment'

# House.destory_all
# Student.destory_all
# Professor.destory_all
# Course.destory_all
# Spell.destory_all


#houses
gryffindor = House.new(name: "Gryffindor")
hufflepuff = House.new(name: "Hufflepuff")
ravenclaw = House.new(name: "Ravenclaw")
slytherin = House.new(name: "Slytherin")

#students
mary = Student.new(name: "Mary")
david = Student.new(name: "David")
dude = Student.new(name: "Dude")
guy = Student.new(name: "Guy")
harry = Student.new(name: "Harry Potter")
ron = Student.new(name: "Ron")
hermione = Student.new(name: "Hermione")

#school
hogwarts = School.new(name: "Hogwarts")

#courses
dada = Course.new(name: "Defense Aganst the Dark Arts")
transfiguration = Course.new(name: "Transfiguration")
divination = Course.new(name: "Divination")
creatures = Course.new(name: "Care of Magical Creatures")
herbology = Course.new(name: "Herbology")



#professors
minerva = Professor.new(name: "Professorr McGonagall", course: transfiguration)
trelawny = Professor.new(name: "professorr Trelawny", course: divination)
neville = Professor.new(name: "Professior Longbottom", course: herbology)
hagrid = Professor.new(name: "Professorr Hagrid", course: creatures)
lupin = Professor.new(name: "Professor Lupin", course: dada)


puts "HELLO WORLD"
