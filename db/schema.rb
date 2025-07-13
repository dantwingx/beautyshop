# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_13_184247) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "service_id", null: false
    t.date "booking_date"
    t.time "booking_time"
    t.integer "status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stylist_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
    t.index ["shop_id"], name: "index_bookings_on_shop_id"
    t.index ["stylist_id"], name: "index_bookings_on_stylist_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name"
    t.text "description"
    t.integer "price"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_services_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "phone"
    t.integer "category"
    t.jsonb "opening_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_urls", default: [], array: true
  end

  create_table "stylists", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name"
    t.string "specialty"
    t.integer "experience_years"
    t.decimal "rating"
    t.string "image_url"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_stylists_on_shop_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.bigint "stylist_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id"], name: "index_time_slots_on_stylist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "phone"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "services"
  add_foreign_key "bookings", "shops"
  add_foreign_key "bookings", "stylists"
  add_foreign_key "bookings", "users"
  add_foreign_key "services", "shops"
  add_foreign_key "stylists", "shops"
  add_foreign_key "time_slots", "stylists"
end
