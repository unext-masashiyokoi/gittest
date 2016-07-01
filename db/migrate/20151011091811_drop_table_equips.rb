class DropTableEquips < ActiveRecord::Migration
  def change
    drop_table :equips
  end
end
