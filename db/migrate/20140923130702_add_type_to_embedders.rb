class AddTypeToEmbedders < ActiveRecord::Migration
  def change
    add_column :embedders, :type, :string
  end
end
