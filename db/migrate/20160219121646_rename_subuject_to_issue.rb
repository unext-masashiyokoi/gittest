class RenameSubujectToIssue < ActiveRecord::Migration
  def change
    rename_column :issues, :subuject, :subject
  end
end
