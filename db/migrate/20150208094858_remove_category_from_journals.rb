class RemoveCategoryFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :category, :string
  end
end
