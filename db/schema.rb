# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160219192344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notebook_sheets", force: :cascade do |t|
    t.integer  "notebook_id"
    t.integer  "sheet_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notebook_sheets", ["notebook_id"], name: "index_notebook_sheets_on_notebook_id", using: :btree
  add_index "notebook_sheets", ["sheet_id"], name: "index_notebook_sheets_on_sheet_id", using: :btree

  create_table "notebook_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notebook_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notebook_users", ["notebook_id"], name: "index_notebook_users_on_notebook_id", using: :btree
  add_index "notebook_users", ["user_id"], name: "index_notebook_users_on_user_id", using: :btree

  create_table "notebooks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sheet_tags", force: :cascade do |t|
    t.integer  "sheet_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sheet_tags", ["sheet_id"], name: "index_sheet_tags_on_sheet_id", using: :btree
  add_index "sheet_tags", ["tag_id"], name: "index_sheet_tags_on_tag_id", using: :btree

  create_table "sheets", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "todo_lists", ["user_id"], name: "index_todo_lists_on_user_id", using: :btree

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "aasm_state"
    t.datetime "due_date"
    t.integer  "todo_list_id"
    t.integer  "sheet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "todos", ["sheet_id"], name: "index_todos_on_sheet_id", using: :btree
  add_index "todos", ["todo_list_id"], name: "index_todos_on_todo_list_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "email",                null: false
    t.string   "authentication_token"
    t.string   "password_digest",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "notebook_sheets", "notebooks"
  add_foreign_key "notebook_sheets", "sheets"
  add_foreign_key "notebook_users", "notebooks"
  add_foreign_key "notebook_users", "users"
  add_foreign_key "sheet_tags", "sheets"
  add_foreign_key "sheet_tags", "tags"
  add_foreign_key "todo_lists", "users"
  add_foreign_key "todos", "sheets"
  add_foreign_key "todos", "todo_lists"
end
