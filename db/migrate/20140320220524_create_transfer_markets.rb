class CreateTransferMarkets < ActiveRecord::Migration
  def change
    create_table :transfer_markets do |t|
      t.integer :value
      t.references :league, index: true
      t.references :team_player, index: true

      t.timestamps
    end
  end
end
