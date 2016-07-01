class CategoryJournalRel < ActiveRecord::Base
	belongs_to :category
	belongs_to :journal
end
