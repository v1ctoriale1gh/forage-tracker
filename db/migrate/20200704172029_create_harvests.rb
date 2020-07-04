class CreateHarvests < ActiveRecord::Migration[6.0]
  def change
    create_table :harvests do |t|
      t.integer :item_id
      t.integer :expedition_id
      t.string :amount

      t.timestamps
    end
  end
end
