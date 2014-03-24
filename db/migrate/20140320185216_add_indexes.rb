class AddIndexes < ActiveRecord::Migration

  def self.up
    add_index :teams, [:name, :user_id, :league_id], :unique => true
    add_index :teams, :name
    add_index :teams, [:user_id,:league_id], :unique => true
    add_index :team_players, [:team_id, :player_id], :unique => true


  end

  def self.down
    remove_index :teams, [:name, :user_id, :league_id], :unique => true
    remove_index :teams, [:user_id,:league_id], :unique => true
    remove_index :teams, :name
    remove_index :team_players, [:team_id, :player_id], :unique => true

  end

end