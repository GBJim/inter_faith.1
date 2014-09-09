class CreateEmbedders < ActiveRecord::Migration
  def change
    create_table :embedders do |t|
      t.integer :post_id
      t.string :favicon_url
      t.string :author_name
      t.string :author_url
      t.string :provider_name
      t.string :provider_url
      t.string :thumbnail_url 
      t.string :thumbnail_width
      t.string :thumbnail_height
      t.string :html
      t.string :width
      t.string :height

      t.timestamps
    end
  end
end
