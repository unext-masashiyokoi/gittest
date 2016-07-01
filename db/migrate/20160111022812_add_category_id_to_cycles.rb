class AddCategoryIdToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :category_id, :integer
  end
end
