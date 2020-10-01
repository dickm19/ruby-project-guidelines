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
trelawny = Professor.create(name: "professorr Trelawny", school: hogwarts)
neville = Professor.create(name: "Professior Longbottom", school: hogwarts)
hagrid = Professor.create(name: "Professorr Hagrid", school: hogwarts)
lupin = Professor.create(name: "Professor Lupin", school: hogwarts)


#courses
dada = Course.create(name: "Defense Aganst the Dark Arts", school: hogwarts, professor: lupin)
transfiguration = Course.create(name: "Transfiguration", school: hogwarts, professor: minerva)
divination = Course.create(name: "Divination", school: hogwarts, professor: trelawny)
creatures = Course.create(name: "Care of Magical Creatures", school: hogwarts, professor: hagrid)
herbology = Course.create(name: "Herbology", school: hogwarts, professor: neville)


# binding.pry

minerva.course

trelawny.course

neville.course

neville.course

lupin.course

#CLI

cli = CLI.new

#cli.welcome
puts "Please enter your name"
student = cli.get_student_name(hogwarts)
$stdout.flush
sleep(1)
puts " "
#cli.sorting_hat(student)
#$stdout.flush
#sleep(1)
#puts " "
courses = hogwarts.courses.map {|course| course.name}
# binding.pry

cli.select_courses(student,courses)

binding.pry


# student.add_course(student.name, selection)