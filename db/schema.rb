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

ActiveRecord::Schema.define(version: 2020_11_03_132505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_enterprises_on_user_id"
  end

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
    t.bigint "enterprise_id"
    t.index ["enterprise_id"], name: "index_members_on_enterprise_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.integer "load"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "enterprise_id"
    t.index ["enterprise_id"], name: "index_positions_on_enterprise_id"
  end

  create_table "project_types", force: :cascade do |t|
    t.string "name"
    t.integer "load"
    t.bigint "enterprise_id"
    t.index ["enterprise_id"], name: "index_project_types_on_enterprise_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "complexity"
    t.boolean "internal"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_type_id"
    t.bigint "enterprise_id"
    t.index ["enterprise_id"], name: "index_projects_on_enterprise_id"
    t.index ["project_type_id"], name: "index_projects_on_project_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enterprises", "users"
  add_foreign_key "manager_projects", "members"
  add_foreign_key "manager_projects", "projects"
  add_foreign_key "member_positions", "members"
  add_foreign_key "member_positions", "positions"
  add_foreign_key "member_projects", "members"
  add_foreign_key "member_projects", "projects"
  add_foreign_key "members", "enterprises"
  add_foreign_key "positions", "enterprises"
  add_foreign_key "project_types", "enterprises"
  add_foreign_key "projects", "enterprises"
  add_foreign_key "projects", "project_types"
end
