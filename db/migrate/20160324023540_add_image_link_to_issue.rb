class AddImageLinkToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :image_link, :string
  end
end
