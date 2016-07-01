class CreateBlogGenres < ActiveRecord::Migration
  def change
    create_table :blog_genres do |t|
      t.integer :blog_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
