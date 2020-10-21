# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_21_011239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manager_projects", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_manager_projects_on_member_id"
    t.index ["project_id"], name: "index_manager_projects_on_project_id"
  end

  create_table "member_positions", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_member_positions_on_member_id"
    t.index ["position_id"], name: "index_member_positions_on_position_id"
  end

  create_table "member_projects", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_member_projects_on_member_id"
    t.index ["project_id"], name: "index_member_projects_on_project_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "load"
    t.boolean "exit_cycle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "load"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "descriptions"
    t.integer "type_project"
    t.integer "complexity"
    t.boolean "internal"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "manager_projects", "members"
  add_foreign_key "manager_projects", "projects"
  add_foreign_key "member_positions", "members"
  add_foreign_key "member_positions", "positions"
  add_foreign_key "member_projects", "members"
  add_foreign_key "member_projects", "projects"
end
