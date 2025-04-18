class MakeRequestsPolymorphic < ActiveRecord::Migration[7.1]
  def change
    remove_reference :requests, :blog, foreign_key: true
    remove_reference :requests, :information, foreign_key: true

    add_reference :requests, :requestable, polymorphic: true, index: true
  end
end
