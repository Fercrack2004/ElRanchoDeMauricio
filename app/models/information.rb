class Information < ApplicationRecord
  has_many :information_participations, dependent: :destroy
  has_many :users, through: :information_participations

  accepts_nested_attributes_for :information_participations
  
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: :all_blank

  has_many :requests, as: :requestable
  has_many :reviews, as: :reviewable
  has_one :chat_room, as: :chatable, dependent: :destroy

    # validaciones
  validates :title, :info_type, :description, presence: true #las referencias pueden ser vacias
  def author
    information_participations.find_by(contribution: :autor)&.user
  end
end