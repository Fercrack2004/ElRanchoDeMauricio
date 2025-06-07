class Ingredient < ApplicationRecord
  belongs_to :blog
  has_one_attached :image

  validates :name, presence: :true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1}
end
