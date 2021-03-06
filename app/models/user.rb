class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :genres, through: :user_genres
  has_many :user_genres
  has_many :blogs
  has_many :photos
  mount_uploader :image, ImageUploader

  include GraphicalHasMany
  graphical_has_many :follows

  has_many :follows
  has_many :follows_as_target, class_name: 'Follow', foreign_key: 'target_user_id'

#  validates :image, presence: true
  validates :name, presence: true, uniqueness: true
  #validates :account_id, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }
end
