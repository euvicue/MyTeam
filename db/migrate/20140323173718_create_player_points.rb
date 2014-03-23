class CreatePlayerPoints < ActiveRecord::Migration
  def change
    create_table :player_points do |t|
      t.references :match_day, index: true
      t.references :player, index: true
      t.integer :points

      t.timestamps
    end
  end
end
