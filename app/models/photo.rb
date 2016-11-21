class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :blogs, through: :blog_photos
  has_many :blog_photos

 # validates :image, presence: true
  validates :comment,    length: { maximum: 255 } 
end
