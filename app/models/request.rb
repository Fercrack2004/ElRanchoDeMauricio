class Request < ApplicationRecord
  belongs_to :user
  belongs_to :requestable, polymorphic: true
  enum state: { Pendiente: 0, Aceptado: 1, Rechazado: 2 }

# Validaciones
  validates :requestable, presence: true

end