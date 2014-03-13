class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :idcard
      t.string :nickname
      t.string :email
      t.integer :phone
      t.string :city
      t.integer :postalcode
      t.string :password
      t.boolean :alerts

      t.timestamps
    end
  end
end
