class AddTitleToEmbedder < ActiveRecord::Migration
  def change
    add_column :embedders, :title, :string
  end
end
