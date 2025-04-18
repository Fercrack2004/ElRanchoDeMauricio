class CreateInformation < ActiveRecord::Migration[7.1]
  def change
    create_table :information do |t|
      t.string :title
      t.date :date
      t.string :info_type
      t.string :description
      t.string :references

      t.timestamps
    end
  end
end
