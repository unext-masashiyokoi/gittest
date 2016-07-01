class AddPriorityToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :priority, :integer
  end
end
