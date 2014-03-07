class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :realteam
      t.string :shirt
      t.string :position
      t.string :nacionality
      t.boolean :transferable

      t.timestamps
    end
  end
end
