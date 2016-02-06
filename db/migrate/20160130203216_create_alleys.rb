class CreateAlleys < ActiveRecord::Migration
  def change
    create_table :alleys do |t|
      t.string :name, null: false
      t.integer :address_id, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
