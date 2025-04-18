class CreateInformationParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :information_participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :information, null: false, foreign_key: true
      t.integer :contribution

      t.timestamps
    end
  end
end
