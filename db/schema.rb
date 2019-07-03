# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190703125711) do

  create_table "master_tables", force: :cascade do |t|
    t.integer "master_id", null: false
    t.integer "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id", "table_id"], name: "index_master_tables_on_master_id_and_table_id", unique: true
    t.index ["master_id"], name: "index_master_tables_on_master_id"
    t.index ["table_id"], name: "index_master_tables_on_table_id"
  end

  create_table "masters", force: :cascade do |t|
    t.integer "campaigns"
    t.boolean "available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_tables", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "table_id"], name: "index_player_tables_on_player_id_and_table_id", unique: true
    t.index ["player_id"], name: "index_player_tables_on_player_id"
    t.index ["table_id"], name: "index_player_tables_on_table_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "campaigns"
    t.boolean "available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "player_id"
    t.integer "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_roles_on_master_id"
    t.index ["player_id", "master_id"], name: "index_roles_on_player_id_and_master_id", unique: true
    t.index ["player_id"], name: "index_roles_on_player_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.boolean "available", default: true, null: false
    t.integer "max_players", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nick_name"
    t.text "description"
    t.string "phone"
    t.string "instagram"
    t.string "twitter"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["instagram"], name: "index_users_on_instagram", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["twitter"], name: "index_users_on_twitter", unique: true
  end

end
