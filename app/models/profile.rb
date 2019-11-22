class Profile < ApplicationRecord

  validates :image, presence: true
  validates :header, presence: true
  validates :bio, presence: true

  has_one_attached :image
  belongs_to :user

  def user_name
    self.user.name
  end

end
