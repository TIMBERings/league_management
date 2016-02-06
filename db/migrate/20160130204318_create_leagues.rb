class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.string :day
      t.string :time, null: false
      t.integer :practice_length, null: false
      t.integer :alley_id, foreign_key: true, null: false
      t.integer :frequency, null: false
      t.integer :occurrences, null: false
      t.integer :scratch, default: 220
      t.integer :handicap_percent, default: 80
      t.integer :handicap_round, default: 'up'
      t.timestamps null: false
    end
  end
end
