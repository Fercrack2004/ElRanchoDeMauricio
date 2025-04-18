class Information < ApplicationRecord
    has_many :information_participations
    has_many :users, through: :information_participations

    has_many :requests, as: :requestable

    has_many :reviews, as: :reviewable
end
