class RenameStartDatetimeEventToStart < ActiveRecord::Migration
  def change
    rename_column :events, :start_datetime, :start
  end
end
