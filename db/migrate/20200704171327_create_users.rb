class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.string :email_address
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
