class RemoveCategroyIdToJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :category_id, :integer
  end
end
