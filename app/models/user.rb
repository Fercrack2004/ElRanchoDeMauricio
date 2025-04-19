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
  validates :phone_number, :email, :role, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # Validación condicional de contraseña
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?

  # Atributo virtual para current_password
  attr_accessor :current_password

  private

  def password_required?
    # Solo requiere password en creación o cuando se cambia explícitamente
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end