class CreateStudentCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :professor_id
    end
  end
end
