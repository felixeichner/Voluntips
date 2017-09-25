class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :region1
      t.string :region2

      t.timestamps
    end
  end
end
