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

  # Validaciones
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :phone_number, :email, :password, :role, presence: true
  validates :password, length: {minimum: 6} #puede ser que al editar un perfil se pida que cambie la constraseña
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i} #https://stackoverflow.com/questions/38611405/email-validation-in-ruby-on-rails
  
end