class AddDraftFlgToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :draft_flg, :boolean, default:0
  end
end
