class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.date :booking_date
      t.time :booking_time
      t.integer :status
      t.integer :total_price

      t.timestamps
    end
  end
end
