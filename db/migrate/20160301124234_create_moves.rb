class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :title
      t.string :transportation
      t.float :distance
      t.time :time
      t.integer :journal_id

      t.timestamps null: false
    end
  end
end
