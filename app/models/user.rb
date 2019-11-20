class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  has_one :profile
  has_many :creations

  has_many :loved_creations
  has_many :loved, through: :loved_creations, source: :creation
  has_many :categories, through: :creations

  def profile_image
    self.profile.image
  end
end
