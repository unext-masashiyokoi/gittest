class CreateCategoryJournalRels < ActiveRecord::Migration
  def change
    create_table :category_journal_rels do |t|
      t.integer :category_id
      t.integer :journal_id

      t.timestamps null: false
    end
  end
end
