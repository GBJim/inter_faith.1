class CreateInterestShips < ActiveRecord::Migration
  def change
    create_table :interest_ships do |t|
      t.references :religion, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
