class AddDescriptionToEmbedder < ActiveRecord::Migration
  def change
    add_column :embedders, :description, :string
  end
end
