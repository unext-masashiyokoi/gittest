class Event < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
  belongs_to :open_range

  validates :open_range_id, presence: true
end
