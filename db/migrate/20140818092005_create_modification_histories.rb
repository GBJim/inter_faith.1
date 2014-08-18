class CreateModificationHistories < ActiveRecord::Migration
  def change
    create_table :modification_histories do |t|
      t.datetime :date
      t.references :post, index: true

      t.timestamps
    end
  end
end
