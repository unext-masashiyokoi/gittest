class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
