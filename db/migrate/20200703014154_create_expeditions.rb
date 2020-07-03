class CreateExpeditions < ActiveRecord::Migration[6.0]
  def change
    create_table :expeditions do |t|
      t.string :description
      t.binary :picture
      t.integer :user_id
      t.datetime :date_and_time
      t.decimal :latitude
      t.decimal :longitude
      t.string :location_name

      t.timestamps
    end
  end
end
