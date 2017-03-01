class Comment < ApplicationRecord
  validates :user_id,:photo_id, :body, presence: true

  belongs_to :user
  belongs_to :photo
  # belongs_to(:photo, :class_name => "Photo", :foreign_key => "photo_id")
  # belongs_to(:user, :class_name => "User", :foreign_key => "user_id")


end

# - Associations
#    - Users have many photos, a photo belongs to a user
#    - Photos have many comments, a comment belongs to a photo
#    - Users have many comments, a comment belongs to a user
#    - Users have many likes, a like belongs to a user
#    - Photos have many likes, a like belongs to a photo
#    - Users have many `liked_photos` through likes. Since this breaks naming conventions (the method name, `.liked_photos`, does not exactly match the class name, `Photo`), we'll have to write out the full form of the has_many/through:
# => -  USERS HAVE MANY "BOOKMARKED_PROPERTIES" THROUGH "PROPERTIES", MANY "PATHWAYS" THROUGH BOOKMARKED_PROPERTIES
#       ```ruby
#       has_many :liked_photos, :through => :likes, :source => :photo
#       ```
#
#    - Similarly, Photos have many fans through likes (source: user):
#
#       ```ruby
#       has_many :fans, :through => :likes, :source => :user
#       ```
#
# - Validations
#    - User
#        - username: presence, uniqueness
#    - Photo
#        - user_id: presence
#    - Like
#        - user_id: presence, uniqueness in combination with photo
#        - photo_id: presence
#    - Comment
#        - user_id: presence
#        - photo_id: presence
#        - body: presence
