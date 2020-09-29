class AddCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :professor
      t.integer :school_id
    end
  end
end
