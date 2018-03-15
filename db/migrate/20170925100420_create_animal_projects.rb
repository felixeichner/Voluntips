class CreateAnimalProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :animal_projects do |t|
      t.integer :animal_id
      t.integer :project_id

      t.timestamps
    end

    add_index :animal_projects, [:animal_id, :project_id]
  end
end
