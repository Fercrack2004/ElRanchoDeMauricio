class BlogParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum contribution: { autor: "autor", editor: "editor" }, _suffix: true
end
