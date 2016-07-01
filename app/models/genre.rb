class Genre < ActiveRecord::Base
  has_many :blogs, through: :blog_genres
  has_many :blog_genres
  has_many :users, through: :user_genres
  has_many :user_genres
  has_many :equips, through: :equip_genres
  has_many :equip_genres
end
