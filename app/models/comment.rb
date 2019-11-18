class Comment < ApplicationRecord
  belongs_to :creation
  belongs_to :user
end
