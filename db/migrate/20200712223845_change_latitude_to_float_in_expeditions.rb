class ChangeLatitudeToFloatInExpeditions < ActiveRecord::Migration[6.0]
  def change
    change_column :expeditions, :latitude, :float
  end
end
