class AddJournalsIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :journals_id, :integer
  end
end
