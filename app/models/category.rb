class Category < ApplicationRecord
  has_many :creations
  has_many :users, through: :creations
end
