class BlogJournal < ActiveRecord::Base
  belongs_to :blog
  belongs_to :journal
end
