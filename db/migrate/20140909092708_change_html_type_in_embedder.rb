class ChangeHtmlTypeInEmbedder < ActiveRecord::Migration
  def change
  	change_column :embedders, :html, :text
  end
end
