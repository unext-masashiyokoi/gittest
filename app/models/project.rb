class Project < ActiveRecord::Base
  has_many :journals
  has_many :issues
  has_many :events
  belongs_to :category
  belongs_to :status
end
