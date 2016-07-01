class CreateEquipGenres < ActiveRecord::Migration
  def change
    create_table :equip_genres do |t|
      t.integer :equip_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
