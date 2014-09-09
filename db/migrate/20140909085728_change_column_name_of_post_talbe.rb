class ChangeColumnNameOfPostTalbe < ActiveRecord::Migration
  def change
  	rename_column :posts, :image, :url
  end
end
