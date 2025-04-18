class Blog < ApplicationRecord
    has_many :blog_participations
    has_many :users, through: :blog_participations

    has_many :requests, as: :requestable

    has_many :reviews, as: :reviewable
end
