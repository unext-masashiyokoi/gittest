class BlogGenre < ActiveRecord::Base
  belongs_to :blog
  belongs_to :genre
end
