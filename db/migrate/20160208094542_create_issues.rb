class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :subuject
      t.integer :project_id
      t.integer :estimated_hours
      t.integer :assigned_to_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
