class BlogParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  enum contribution: { autor: 0, editor: 1 }, _suffix: true

end