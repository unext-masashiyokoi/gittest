class BlogPhoto < ActiveRecord::Base
  belongs_to :blog
  belongs_to :photo
end
