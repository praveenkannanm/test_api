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

ActiveRecord::Schema.define(version: 2019_02_04_150952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_users_on_list_id"
    t.index ["user_id"], name: "index_list_users_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_lists_on_created_by"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "username"
    t.string "token"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_users_on_token"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "list_users", "lists"
  add_foreign_key "list_users", "users"
end
