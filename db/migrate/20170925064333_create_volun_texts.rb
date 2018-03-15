class CreateVolunTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :volun_texts do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :volun_texts, :slug, unique: true
  end
end
