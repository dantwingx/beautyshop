class CreateTimeSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :time_slots do |t|
      t.references :stylist, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :is_available

      t.timestamps
    end
  end
end
