class CreateWebPages < ActiveRecord::Migration[7.0]
  def change
    create_table :web_pages do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
