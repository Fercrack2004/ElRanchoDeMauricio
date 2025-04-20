class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  
  belongs_to :chatable, polymorphic: true

  # Validaciones
  validates :name, :chatable, presence: true
end
