class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_mod, :boolean, default: false, null: false
  end
end
