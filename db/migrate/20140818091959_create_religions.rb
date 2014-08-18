class CreateReligions < ActiveRecord::Migration
  def change
    create_table :religions do |t|
      t.string :name
      t.text :description
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
