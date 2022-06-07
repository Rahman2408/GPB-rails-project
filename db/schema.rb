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

ActiveRecord::Schema.define(version: 2021_08_05_210421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_features_on_project_id"
    t.index ["user_id"], name: "index_project_features_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "goal"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.bigint "project_owner_id"
    t.index ["project_owner_id"], name: "index_users_on_project_owner_id"
  end

  add_foreign_key "project_features", "projects"
  add_foreign_key "project_features", "users"
  add_foreign_key "projects", "users", column: "owner_id"
  add_foreign_key "users", "users", column: "project_owner_id"
end
