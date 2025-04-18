class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.date :date
      t.string :public_type
      t.string :description

      t.timestamps
    end
  end
end
