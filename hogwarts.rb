require_relative 'config/environment'
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
dada = Course.create(name: "Defense Against the Dark Arts", school: hogwarts, professor: lupin)
transfiguration = Course.create(name: "Transfiguration", school: hogwarts, professor: minerva)
potions = Course.create(name: "Potions", school: hogwarts, professor: snape)
charms = Course.create(name: "Charms", school: hogwarts, professor: flitwick)



#Spells
riddikulus = Spell.create(name: "Boggart-Banishing Spell (Riddikulus)", description: "The boggart wriggles around for a moment and has now morphed from your wost fear into your favorite comedian.", course: dada, status: "unmastered")
stupefy = Spell.create(name: "Stunning Spell (Stupefy)", description: "Your opponent falls to the ground, unconcious.", course: dada, status: "unmastered")
reparo = Spell.create(name: "Mending Charm (Reparo)", description: "The broken object that you cast the spell on repairs itself before your eyes.", course: transfiguration, status: "unmastered")
incendio = Spell.create(name: "Fire-Making Spell (Incendio)", description: "A jet of flames shoots out of the end of your wand. Professor McGonagall does not look happy.", course: transfiguration, status: "unmastered")
liquid_luck = Spell.create(name: "Liquid Luck Potion (Felix Felicis)", description: "You've successfully brewed Liquid Luck!", course: potions, status: "unmastered")
alihotsy_draught = Spell.create(name: "Laughing potion (Alihotsy Draught)", description: "You've successfully brewed a Laughing Potion.", course: potions, status: "unmastered")
wingardium = Spell.create(name: "Levitation Charm (Wingardium Leviosa)", description: "The object that you cast the spell on begins to levitate", course: charms, status: "unmastered")
colovaria = Spell.create(name: "Color Change Charm (Colovaria)", description: "The object that you cast the spell on changes its color", course: charms, status: "unmastered")




#CLI
puts " "
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


cli.select_courses(student,courses)

puts " "
puts "Now that you've been sorted into your house and have chosen your courses, you are ready to begin studying at Hogwarts!"
puts " "
prompt.ask('Press "Enter" to continue', echo: false)
cli.choices(student)



