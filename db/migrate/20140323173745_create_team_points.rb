class CreateTeamPoints < ActiveRecord::Migration
  def change
    create_table :team_points do |t|
      t.references :match_day, index: true
      t.references :team, index: true
      t.integer :points

      t.timestamps
    end
  end
end
