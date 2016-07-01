class AddImageLinkToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :image_link, :string
  end
end
