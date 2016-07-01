class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :title
      t.string :content
      t.float :distance
      t.string :category
      t.time :time
      t.date :date
      t.string :place
      t.string :open_range

      t.timestamps null: false
    end
  end
end
