class CreateBlogParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.integer :contribution

      t.timestamps
    end
  end
end
