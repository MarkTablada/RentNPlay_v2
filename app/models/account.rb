class Account < ApplicationRecord
  has_secure_password

  validates :user_type, numericality: true

  validates :username, uniqueness: true

  validates :password_confirmation, presence: true

  validates :full_name, presence: true

  validates :mobile_number, numericality: true
  validates :mobile_number, length: {minimum: 11}

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
end
