class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  
  belongs_to :chatable, polymorphic: true
  validates :chatable_id, uniqueness: { scope: :chatable_type }

  # Validaciones
  validates :name, :chatable, presence: true
end
