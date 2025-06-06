class Blog < ApplicationRecord
  has_many :blog_participations, dependent: :destroy
  has_many :users, through: :blog_participations

  accepts_nested_attributes_for :blog_participations

  has_many :requests, as: :requestable, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_one :chat_room, as: :chatable, dependent: :destroy

    # Validaciones
  validates :title, :public_type, :description,  presence: true
  validates :cook_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  def average_rating
    return 0 unless reviews.any?
    
    # .average(:stars) es un método de Rails que calcula el promedio de la columna 'stars'.
    # .round(1) lo redondea a 1 decimal para que se vea bien (ej. 4.5).
    reviews.average(:score).round(1)
  end
    
end