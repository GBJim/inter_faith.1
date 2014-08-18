class CreateReferenceShips < ActiveRecord::Migration
  def change
    create_table :reference_ships do |t|
      t.references :religion, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
