class Journal < ActiveRecord::Base
  has_many :category, through: :category_journal_rels
  has_many :category_journal_rels
  has_many :moves
  belongs_to :open_range
  belongs_to :project
  belongs_to :issue


  validates :project_id, presence: true
  validates :open_range_id, presence: true

  def monthty_time_amount 
    Journal.find_by_sql('SELECT SUBSTRING(date, 1, 7) as yearmonth, SUM(TIME_TO_SEC(time)) as sec FROM journals GROUP BY SUBSTRING(date, 1, 7)' )
  end
end
