class CreateTransferMarkets < ActiveRecord::Migration
  def change
    create_table :transfer_markets do |t|
      t.references :league, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
