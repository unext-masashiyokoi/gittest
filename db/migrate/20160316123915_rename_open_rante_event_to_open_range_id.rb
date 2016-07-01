class RenameOpenRanteEventToOpenRangeId < ActiveRecord::Migration
  def change
    rename_column :events, :open_range, :opan_range_id
  end
end
