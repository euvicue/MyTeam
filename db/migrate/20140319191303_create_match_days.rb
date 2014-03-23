class CreateMatchDays < ActiveRecord::Migration
  def change
    create_table :match_days do |t|
      t.integer :number
      t.timestamp :deadline
      t.timestamp :weekend_date
      t.references :league, index: true

      t.timestamps
    end
  end
end
