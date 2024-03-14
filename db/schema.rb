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

ActiveRecord::Schema.define(version: 2024_03_12_052833) do

  create_table "chats", charset: "utf8", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coaches", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coaches_on_user_id"
  end

  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "coach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_orders_on_coach_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", charset: "utf8", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "order_id", null: false
    t.integer "rank_id", null: false
    t.text "character", null: false
    t.string "play_style", null: false
    t.string "play_time", null: false
    t.text "play_device", null: false
    t.text "communication_tool", null: false
    t.text "goal", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_payments_on_coach_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "room_coaches", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "coach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_room_coaches_on_coach_id"
    t.index ["room_id"], name: "index_room_coaches_on_room_id"
  end

  create_table "room_users", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.bigint "coach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_room_users_on_coach_id"
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "game_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coaches", "users"
  add_foreign_key "orders", "coaches"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "coaches"
  add_foreign_key "payments", "orders"
  add_foreign_key "room_coaches", "coaches"
  add_foreign_key "room_coaches", "rooms"
  add_foreign_key "room_users", "coaches"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "students", "users"
end
