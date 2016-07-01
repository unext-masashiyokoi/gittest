class CreateBlogPhotos < ActiveRecord::Migration
  def change
    create_table :blog_photos do |t|
      t.integer :blog_id
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
