class Request < ApplicationRecord
  belongs_to :user
  belongs_to :requestable, polymorphic: true
  enum state: { pending: 0, accepted: 1, rejected: 2 }

# Validaciones
  validates :requestable, presence: true

end