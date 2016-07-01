class AddIssueIdToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :issue_id, :integer
  end
end
