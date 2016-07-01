class AddTagToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :category_id, :integer
  end
end
