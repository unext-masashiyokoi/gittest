class CreateFishings < ActiveRecord::Migration
  def change
    create_table :fishings do |t|
      t.string :title
      t.text :content
      t.string :fish
      t.integer :count
      t.string :place
      t.time :time

      t.timestamps null: false
    end
  end
end
