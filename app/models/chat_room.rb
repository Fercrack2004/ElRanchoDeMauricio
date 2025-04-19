class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  
  belongs_to :chatable, polymorphic: true
  has_many :messages, dependent: :destroy
end
