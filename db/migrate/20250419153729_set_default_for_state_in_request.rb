class SetDefaultForStateInRequest < ActiveRecord::Migration[7.1]
  def change
    change_column_default :requests, :state, 0
  end
end
