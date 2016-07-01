class AddConstsToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :cost, :integer
  end
end
