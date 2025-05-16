class Blog < ApplicationRecord
  has_many :blog_participations, dependent: :destroy
  has_many :users, through: :blog_participations

  accepts_nested_attributes_for :blog_participations

  has_many :requests, as: :requestable
  has_many :reviews, as: :reviewable
  has_one :chat_room, as: :chatable, dependent: :destroy

    # Validaciones
  validates :title, :public_type, :description, :cook_time, presence: true

    
end