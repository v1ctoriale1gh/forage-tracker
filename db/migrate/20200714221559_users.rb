class Users < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :email_address, :email
  end
end
