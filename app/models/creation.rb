class Creation < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :loved_creations
  has_many :loved_by, through: :loved_creations, source: :user

  def user_profile
    self.user.profile
  end

  def reset_flags
    self.update_attribute(flag_count: nil)
  end

  def reset_hearts
    self.update_attribute(heart_count: nil)
  end

  def increase_flag_count
    if self.flag_count
      self.flag_count += 1
    else
      self.flag_count = 1
    end
    self.save
  end

  def increase_heart_count
    if self.heart_count
      self.heart_count += 1
    else
      self.heart_count = 1
    end
    self.save
  end

end
