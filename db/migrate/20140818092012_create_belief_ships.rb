class CreateBeliefShips < ActiveRecord::Migration
  def change
    create_table :belief_ships do |t|
      t.references :religion, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
