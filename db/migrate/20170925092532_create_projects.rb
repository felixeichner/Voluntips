class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :preview
      t.text :summary
      t.text :qualification
      t.text :work
      t.text :accomodation
      t.text :costs
      t.text :address
      t.string :tel
      t.string :email
      t.string :webpage
      t.integer :min_weeks
      t.integer :costs_week
      t.string :accom_standard
      t.string :lat
      t.string :lgt
      t.string :images
      t.string :slug

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
