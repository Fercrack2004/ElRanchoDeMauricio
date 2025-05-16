class SetDefaultForReferencesInInformation < ActiveRecord::Migration[7.1]
  def change
    change_column_default :information_pages, :references, []
  end
end
