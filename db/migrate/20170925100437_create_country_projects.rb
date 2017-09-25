class CreateCountryProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :country_projects do |t|
      t.integer :country_id
      t.integer :project_id

      t.timestamps
    end

    add_index :country_projects, [:country_id, :project_id]
  end
end
