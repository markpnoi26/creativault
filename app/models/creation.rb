class Creation < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_one_attached :image

  def user_profile
    self.user.profile
  end

end
