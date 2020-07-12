class ChangeLongitudeToFloatInExpeditions < ActiveRecord::Migration[6.0]
  def change
    change_column :expeditions, :longitude, :float
  end
end
