class AddCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :professor_id
      t.integer :school_id
    end
  end
end
