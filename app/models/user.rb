class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :name, presence: true
  validates :username, presence: true

  has_one :profile
  has_many :creations
  has_many :comments
  # has_many :loved_creations
  # has_many :creations, through: :loved_creations
  has_many :categories, through: :creations

end
