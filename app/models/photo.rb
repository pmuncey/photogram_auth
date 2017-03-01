class Photo < ApplicationRecord
  validates :user_id, presence: true

  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")

  has_many :comments
  has_many :likes
  has_many :fans, :through => :likes, :source => :user
end
