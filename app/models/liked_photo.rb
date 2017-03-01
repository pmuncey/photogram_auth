class Liked_Photo < ApplicationRecord
  belongs_to :user
  belongs_to :photo
end
