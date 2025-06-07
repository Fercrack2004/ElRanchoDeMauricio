class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.references :information, foreign_key: true
      t.timestamps
    end
  end
end
