class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.integer :category
      t.jsonb :opening_hours

      t.timestamps
    end
  end
end
