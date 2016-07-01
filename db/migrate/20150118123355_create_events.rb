class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :place
      t.string :open_range

      t.timestamps null: false
    end
  end
end
