class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps null: false
    end
  end
end
