class ChangeUrlFormatInPost < ActiveRecord::Migration
  def change
  	rename_column :embedders, :type, :resource_type
  end
end
