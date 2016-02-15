class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :league_id, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
