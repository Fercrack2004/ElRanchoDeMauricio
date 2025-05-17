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

    
end