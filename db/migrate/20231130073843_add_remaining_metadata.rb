class AddRemainingMetadata < ActiveRecord::Migration[7.0]
  def change
    add_column :web_pages, :last_fetched_at, :datetime
    add_column :web_pages, :link_count, :integer
    add_column :web_pages, :image_count, :integer
  end
end
