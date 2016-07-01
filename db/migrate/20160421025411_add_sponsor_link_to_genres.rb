class AddSponsorLinkToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :sponsor_link, :text
  end
end
