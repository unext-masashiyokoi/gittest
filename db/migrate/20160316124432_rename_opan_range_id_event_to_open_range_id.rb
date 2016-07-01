class RenameOpanRangeIdEventToOpenRangeId < ActiveRecord::Migration
  def change
    rename_column :events, :opan_range_id, :open_range_id
  end
end
