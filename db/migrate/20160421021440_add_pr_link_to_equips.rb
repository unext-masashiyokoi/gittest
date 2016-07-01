class AddPrLinkToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :pr_link, :text
  end
end
