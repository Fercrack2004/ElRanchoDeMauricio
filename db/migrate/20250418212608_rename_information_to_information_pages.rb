class RenameInformationToInformationPages < ActiveRecord::Migration[7.1]
  def change
    rename_table :information, :information_pages
  end
end
