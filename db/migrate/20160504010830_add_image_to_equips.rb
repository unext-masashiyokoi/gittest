class AddImageToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :image, :string
  end
end
