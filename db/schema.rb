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

ActiveRecord::Schema[8.0].define(version: 2024_07_03_053219) do
  create_table "chats", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rank_id", null: false
    t.string "kill_rate", null: false
    t.text "character", null: false
    t.string "play_style", null: false
    t.string "play_time", null: false
    t.text "play_device", null: false
    t.text "communication_tool", null: false
    t.string "price", null: false
    t.string "times_to_teach", null: false
    t.integer "rank_limit_id", null: false
    t.text "appeal_point", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_coaches_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directmessages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_directmessages_on_room_id"
    t.index ["user_id"], name: "index_directmessages_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "coach_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_orders_on_coach_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "coach_id", null: false
    t.integer "order_id", null: false
    t.integer "rank_id", null: false
    t.text "character", null: false
    t.string "play_style", null: false
    t.string "play_time", null: false
    t.text "play_device", null: false
    t.text "communication_tool", null: false
    t.text "goal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_payments_on_coach_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "coach_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_rooms_on_coach_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rank_id", null: false
    t.string "kill_rate", null: false
    t.text "character", null: false
    t.string "play_style", null: false
    t.string "play_time", null: false
    t.text "play_device", null: false
    t.text "communication_tool", null: false
    t.string "price", null: false
    t.string "times_to_teach", null: false
    t.text "enthusiasm_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "game_name", null: false
    t.integer "role_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coaches", "users"
  add_foreign_key "directmessages", "rooms"
  add_foreign_key "directmessages", "users"
  add_foreign_key "orders", "coaches"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "coaches"
  add_foreign_key "payments", "orders"
  add_foreign_key "rooms", "coaches"
  add_foreign_key "rooms", "users"
  add_foreign_key "students", "users"
end
