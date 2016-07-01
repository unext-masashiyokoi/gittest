class Equip < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :genres, through: :equip_genres
  has_many :equip_genres
end
