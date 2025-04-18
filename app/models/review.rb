class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  # Validaciones
  validates :reviewable, :user, :content, presence: true

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 10.0 }
end