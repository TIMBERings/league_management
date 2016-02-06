class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|
      t.string :name, null: false
      t.string :usbc_number

      t.timestamps null: false
    end

    add_index(:bowlers, :usbc_number, unique: true)
  end
end
