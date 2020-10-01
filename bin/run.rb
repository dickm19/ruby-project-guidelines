require_relative '../config/environment'
require 'sinatra/activerecord/rake'
require 'pry'
require "tty-prompt"

prompt = TTY::Prompt.new


House.destroy_all
Student.destroy_all
Professor.destroy_all
Course.destroy_all
Spell.destroy_all
School.destroy_all
StudentCourse.destroy_all
#School
hogwarts = School.create(name: "Hogwarts")

#Houses
gryffindor = House.create(name: "Gryffindor", school: hogwarts)
hufflepuff = House.create(name: "Hufflepuff", school: hogwarts)
ravenclaw = House.create(name: "Ravenclaw", school: hogwarts)
slytherin = House.create(name: "Slytherin", school: hogwarts)

#Professors
minerva = Professor.create(name: "Professorr McGonagall", school: hogwarts)
snape = Professor.create(name: "professorr Snape", school: hogwarts)
flitwick = Professor.create(name: "Professorr Flitwick", school: hogwarts)
lupin = Professor.create(name: "Professor Lupin", school: hogwarts)


#courses
dada = Course.create(name: "Defense Aganst the Dark Arts", school: hogwarts, professor: lupin)
transfiguration = Course.create(name: "Transfiguration", school: hogwarts, professor: minerva)
potions = Course.create(name: "Potions", school: hogwarts, professor: snape)
charms = Course.create(name: "Charms", school: hogwarts, professor: flitwick)



#Spells
riddikulus = Spell.create(name: "Boggart-Banishing Spell (Riddikulus)", description: "Forces the Boggart to assume a form that is humerous to the caster, taking away its ability to terrorize.", course: dada, status: "unmastered")
stupefy = Spell.create(name: "Stunning Spell (Stupefy)", description: "Stuns the target, rendering them unconscious.", course: dada, status: "unmastered")
reparo = Spell.create(name: "Mending Charm (Reparo)", description: "Seamlessly repairs a broken object.", course: transfiguration, status: "unmastered")
incendio = Spell.create(name: "Fire-Making Spell (Incendio)", description: "Conjures a jet of flames.", course: transfiguration, status: "unmastered")
liquid_luck = Spell.create(name: "Liquid Luck Potion (Felix Felicis)", description: "Makes the drinker lucky for a period of time, during which everything they attempt will be successful.", course: potions, status: "unmastered")
alihotsy_draught = Spell.create(name: "Laughing potion (Alihotsy Draught)", description: "Induces hysteria and uncontrollable laughter on its drinker.", course: potions, status: "unmastered")
wingardium = Spell.create(name: "Levitation Charm (Wingardium Leviosa)", description: "Causes an object to levitate", course: charms, status: "unmastered")
accio = Spell.create(name: "Summoning Charm (Accio *object*)", description: "Summons a stated object towards the caster", course: charms, status: "unmastered")





#CLI

cli = CLI.new

cli.welcome
puts "Please enter your name"
student = cli.get_student_name(hogwarts)
$stdout.flush
sleep(1)
puts " "
cli.sorting_hat(student)
$stdout.flush
sleep(1)
puts " "
courses = hogwarts.courses.map {|course| course.name}
# binding.pry

cli.select_courses(student,courses)


# cli.view_courses(student)

# cli.view_professors(student)

#binding.pry

puts "Now that you've been sorted into your house and have chosen your courses, you are ready to begin studying at Hogwarts!"
cli.choices(student)



