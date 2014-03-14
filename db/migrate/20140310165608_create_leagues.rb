class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :private

      t.timestamps
    end
  end
end
