class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  
  belongs_to :chatable, polymorphic: true

  # Validaciones
  validates :name, :chatable, presence: true
end
