class Blog < ApplicationRecord
    has_many :blog_participations
    has_many :users, through: :blog_participations

    accepts_nested_attributes_for :blog_participations

    has_many :requests, as: :requestable

    has_many :reviews, as: :reviewable

    # Validaciones
    validates :title, :public_type, :description, presence: true

    #has_one_attached :image
    #validate :checkear_editor

    #def checkear_editor
    #    if users.none?(&:moderator?) #revisa si ni un user en blog_participation es editor
    #        errors.add(:users, "no tiene editor")
    #    end
    #end

    
end