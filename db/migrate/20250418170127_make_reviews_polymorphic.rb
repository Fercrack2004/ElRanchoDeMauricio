class MakeReviewsPolymorphic < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :blog, foreign_key: true
    remove_reference :reviews, :information, foreign_key: true

    add_reference :reviews, :reviewable, polymorphic: true, index: true
  end
end
