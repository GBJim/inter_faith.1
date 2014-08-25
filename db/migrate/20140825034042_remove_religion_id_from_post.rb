class RemoveReligionIdFromPost < ActiveRecord::Migration
  def change
  	remove_column :posts, :religion_id
  end
end
