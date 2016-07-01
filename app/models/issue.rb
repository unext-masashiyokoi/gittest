class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :status
  has_many :journals
end
