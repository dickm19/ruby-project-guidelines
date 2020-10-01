class AddProfessorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.integer :course_id
      t.integer :school_id
    end
  end
end
