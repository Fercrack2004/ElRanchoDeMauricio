class Ingredient < ApplicationRecord
  belongs_to :blog
  has_one_attached :image

  validates :name, presence: :true
  validates :quantity, presence: true
end
