class FlaggedCreation < ApplicationRecord
  belongs_to :user
  belongs_to :creation
end
