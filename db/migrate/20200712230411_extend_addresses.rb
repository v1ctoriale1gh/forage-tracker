class ExtendAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :expeditions, :country, :string
    add_column :expeditions, :state, :string
    add_column :expeditions, :city, :string
    add_column :expeditions, :street, :string
    add_column :expeditions, :street_number, :string
    add_column :expeditions, :zipcode, :string
    add_column :expeditions, :address, :string
  end
end
