class Blog < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :genres, through: :blog_genres
  has_many :blog_genres
  has_many :photos, through: :blog_photos
  has_many :blog_photos 
  has_many :journals, through: :blog_journals
  has_many :blog_journals
  has_many :comments

 # attr_accessible :users_attributes

  validates :user_id, presence: true
  validates :title, presence: true, if: :not_draft?
  validates :content, length: {minimum: 141}, if: :image_nothing?, if: :not_draft?
#  validate :user_image_exist


  def self.top_page_blogs
    find_by_sql("(select id, title, user_id, published_at as created_at, 'blog' as content_flg from blogs where (user_id, published_at) in ( select user_id, max(published_at) from blogs where draft_flg = false group by user_id ) ) union all (select id, name as title, user_id, created_at, 'photo' as content_flg from photos where (user_id, created_at) in ( select user_id, max(created_at) from photos group by user_id ))  order by created_at desc")
  end

  def image_nothing?
    image.present? == false
  end

  def not_draft?
    draft_flg == false
  end

  scope :published, -> { where draft_flg: false }
  scope :published_before, -> (time){ where("published_at < ?", time) }
  scope :users, ->(user_id) { where("user_id = ?", user_id) }

  private
    def user_image_exist
      if ! blog.user.image.present?
        errors.add(:user_image, "can't be in the past")
      end
    end
end
