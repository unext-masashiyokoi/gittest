class RenameEndDatetimeEventToEnd < ActiveRecord::Migration
  def change
    rename_column :events, :end_datetime, :end
  end
end
