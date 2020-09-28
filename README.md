Hogwarts App

CLASSES
- School
- Professor
- Course
- Student
- House

RELATIONSHIPS
School:
- Has many Student, House, Professor, and Course

Student:
- Has many Professor through Course
- Belongs to House and School

Professor:
- Has many Student through Course
- Belongs to school

House:
- Has many students


