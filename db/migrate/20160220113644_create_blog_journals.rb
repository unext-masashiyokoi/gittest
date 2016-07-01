class CreateBlogJournals < ActiveRecord::Migration
  def change
    create_table :blog_journals do |t|
      t.integer :blog_id
      t.integer :journal_id

      t.timestamps null: false
    end
  end
end
