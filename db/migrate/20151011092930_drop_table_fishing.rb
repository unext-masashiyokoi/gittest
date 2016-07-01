class DropTableFishing < ActiveRecord::Migration
  def change
    drop_table :fishings
  end
end
