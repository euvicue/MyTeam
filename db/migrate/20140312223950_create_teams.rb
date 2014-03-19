class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, index: true
      t.belongs_to :user, index: true
      t.belongs_to :league, index:true
      t.timestamps
    end
  end
end
