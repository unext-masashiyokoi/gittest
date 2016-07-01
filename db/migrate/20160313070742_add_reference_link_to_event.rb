class AddReferenceLinkToEvent < ActiveRecord::Migration
  def change
    add_column :events, :reference_link, :string
  end
end
