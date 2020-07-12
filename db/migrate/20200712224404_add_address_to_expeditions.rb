class AddAddressToExpeditions < ActiveRecord::Migration[6.0]
  def change
    add_column :expeditions, :address, :string
  end
end
