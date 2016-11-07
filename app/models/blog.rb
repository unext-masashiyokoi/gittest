class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :genres, through: :blog_genres
  has_many :blog_genres
  has_many :photos, through: :blog_photos
  has_many :blog_photos 
  has_many :journals, through: :blog_journals
  has_many :blog_journals
  has_many :comments
  validates :user_id, presence: true

  scope :published, -> { where draft_flg: false }
  scope :users, ->(user_id) { where("user_id = ?", user_id) }
end
