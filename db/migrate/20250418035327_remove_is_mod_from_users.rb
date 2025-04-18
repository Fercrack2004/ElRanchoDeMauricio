class RemoveIsModFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :is_mod, :boolean
  end
end
