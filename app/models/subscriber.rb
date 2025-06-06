class Subscriber < ApplicationRecord
  validates :email, presence: true
  
  validates :email, uniqueness: { case_sensitive: false }
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end