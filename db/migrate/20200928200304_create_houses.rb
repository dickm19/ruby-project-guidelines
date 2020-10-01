class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :school_id
      t.integer :points
    end
  end
end
