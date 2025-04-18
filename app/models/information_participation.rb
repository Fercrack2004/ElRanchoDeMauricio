class InformationParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :information

  enum contribution: { autor: "autor", editor: "editor" }, _suffix: true
end
