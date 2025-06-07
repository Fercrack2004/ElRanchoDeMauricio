class Step < ApplicationRecord
  belongs_to :blog
  has_one_attached :image

  validates :description, presence: :true
  validates :step_num, presence: :true, numericality: { greater_than_or_equal_to: 1}
end
