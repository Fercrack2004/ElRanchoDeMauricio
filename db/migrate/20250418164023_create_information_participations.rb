class CreateInformationParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :information_participations do |t|
      t.references :user, null: false, foreign_key: true

      t.bigint :information_id, null: false
      t.integer :contribution

      t.timestamps
    end

    add_index :information_participations, :information_id
    add_foreign_key :information_participations, :information_pages, column: :information_id
  end
end