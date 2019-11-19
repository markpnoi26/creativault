class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def user_name
    self.user.name
  end
  
end
