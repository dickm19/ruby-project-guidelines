class AddSpellsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :description
      t.integer :course_id
      t.string :status
    end
  end
end
