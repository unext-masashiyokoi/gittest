class CreateEquips < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.string :name
      t.text :detail
      t.date :date
      t.string :status, limit: 1
      t.integer :priority, limit: 2
      t.string :bland
      t.integer :price

      t.timestamps null: false
    end
  end
end
