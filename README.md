Hogwarts App

CLASSES
- School
- Professor
- Course
- Student
- House
- Spell

RELATIONSHIPS
School:
- Has many Student, House, Professor, and Course

Student:
- Has many Professor through Course
- Belongs to House and School
- Has many spells

Professor:
- Has many Student through Course
- Belongs to school
- Has many spells

House:
- Has many students

Course:
- Has many Student
- Belongs to Professor
- Has many spells

Spell:
- belongs to students
- belongs to courses


NEXT STEPS:
- Create tables for each class
    - new migrate folder
    - new files for each migration
- Map out aggregate/helper methods


    TABLES
    <!-- - House Table
        - :name -->

    <!-- - Student Table
        - :name
        - :house -->
        - :year (maybe later)

    - Courses Table
        - :professor

    - Professors Table
        :name
    

    HOUSE METHODS
    <!-- - House#students
        - returns an array of all students in that house instance
    - House#School
        - returns the school that that house belongs to -->
    - House#Points (later)
        - returns the total points for that house instance

    SCHOOL METHODS
    <!-- - School#Houses
        - returns an array of all houses that belong to the school
    - School#Students
        returns an array of all students in that school
    - School#Professors
        - returns an array of all professors that work at the school
    - School#Courses
        - returns an array of all courses offered at the school -->
    <!-- - School#sort_student(student)
        - takes in a student instance and adds that student to a ramdom house -->

    STUDENT METHODS
    <!-- - Student#House
        - returns the house that the student belongs to
    - Student#School
        - returns the school that the student belongs to
    - Student#Courses
        - returns an array of all courses that the student attends -->

    - Student#year (maybe later)
     - Student#pet (maybe later)




    






