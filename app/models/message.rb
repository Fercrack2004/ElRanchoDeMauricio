class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  # Validaciones
  validates :content,:user_id, :chat_room_id, presence: true
end
