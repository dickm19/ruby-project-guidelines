class AddProfessorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :course
    end
  end
end
