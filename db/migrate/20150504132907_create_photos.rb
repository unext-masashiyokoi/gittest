class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :comment

      t.timestamps null: false
    end
  end
end
