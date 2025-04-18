class InformationParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :information

  enum contribution: { autor: 0, editor: 1 }, _suffix: true

  # Validations
  validates :contribution, presence: true

end