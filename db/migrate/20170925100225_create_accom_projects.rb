class CreateAccomProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :accom_projects do |t|
      t.integer :accom_id
      t.integer :project_id

      t.timestamps
    end

    add_index :accom_projects, [:accom_id, :project_id]
  end
end
