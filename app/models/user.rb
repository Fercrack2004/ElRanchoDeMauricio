class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :blog_participations
  has_many :blogs, through: :blog_participations

  has_many :information_participations
  has_many :information_pages, through: :information_participations, source: :information

  has_many :requests

  # Divide los tipos de usuario
  enum role: { user: 0, moderator: 1, admin: 2 }
end
