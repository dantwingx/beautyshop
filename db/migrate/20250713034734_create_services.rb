class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
