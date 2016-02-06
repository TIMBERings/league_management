class CreateBowlersTeams < ActiveRecord::Migration
  def change
    create_table :bowlers_teams, id: false do |t|
      t.integer :bowler_id, null: false
      t.integer :team_id, null: false
    end

    add_index :bowlers_teams, [:bowler_id, :team_id], unique: true
  end
end
