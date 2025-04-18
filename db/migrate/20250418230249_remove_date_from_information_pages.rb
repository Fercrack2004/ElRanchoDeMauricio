class RemoveDateFromInformationPages < ActiveRecord::Migration[7.1]
  def change
    remove_column :information_pages, :date, :date
  end
end
