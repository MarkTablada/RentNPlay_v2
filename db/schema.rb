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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_095625) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_type"
    t.string "username"
    t.string "password_digest"
    t.string "full_name"
    t.string "email"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.string "description"
    t.date "release_date"
    t.string "genre"
    t.string "platform"
    t.integer "rent_rate"
    t.integer "max_rent_duration"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "maturity_rating"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "name"
    t.integer "mobile_number"
    t.string "house_number"
    t.string "barangay"
    t.string "city"
    t.string "province"
    t.integer "game"
    t.integer "rent_rate"
    t.date "start_date"
    t.integer "rent_duration"
    t.date "end_date"
    t.integer "sub_total"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_id"
    t.string "receiver_name"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.string "status"
    t.integer "rent_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
