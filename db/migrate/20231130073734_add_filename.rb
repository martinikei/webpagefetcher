class AddFilename < ActiveRecord::Migration[7.0]
  def change
    add_column :web_pages, :file_name, :string
  end
end
