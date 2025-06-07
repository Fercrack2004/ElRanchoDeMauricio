class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.references :blog, null: false, foreign_key: true
      t.text :description
      t.integer :step_num

      t.timestamps
    end
  end
end
