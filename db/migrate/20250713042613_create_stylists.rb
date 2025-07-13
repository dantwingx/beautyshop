class CreateStylists < ActiveRecord::Migration[8.0]
  def change
    create_table :stylists do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name
      t.string :specialty
      t.integer :experience_years
      t.decimal :rating
      t.string :image_url
      t.text :bio

      t.timestamps
    end
  end
end
