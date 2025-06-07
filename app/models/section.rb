class Section < ApplicationRecord
  belongs_to :information
  has_one_attached :image
  
  validates :title, :content, presence: true
end
