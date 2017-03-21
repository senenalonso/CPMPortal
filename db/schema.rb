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

ActiveRecord::Schema.define(version: 20170321195551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advices", force: :cascade do |t|
    t.text     "problem"
    t.text     "explanation"
    t.text     "before"
    t.text     "after"
    t.integer  "improvement1"
    t.string   "unit1"
    t.string   "metric1"
    t.integer  "improvement2"
    t.string   "unit2"
    t.string   "metric2"
    t.integer  "improvement3"
    t.string   "unit3"
    t.string   "metric3"
    t.integer  "component_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "status",       default: "En desarrollo"
    t.string   "short",        default: "Recomendación"
    t.index ["component_id"], name: "index_advices_on_component_id", using: :btree
  end

  create_table "components", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.integer  "project_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status",      default: "En curso"
    t.index ["project_id"], name: "index_components_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "code",                                    null: false
    t.string   "name",                                    null: false
    t.text     "description"
    t.text     "result"
    t.string   "date_requested",                          null: false
    t.string   "date_start"
    t.string   "date_finish"
    t.string   "scope",                                   null: false
    t.string   "category",                                null: false
    t.integer  "priority"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "status",         default: "Sin asingnar"
    t.string   "remedy"
    t.string   "uuaa"
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id",    null: false
    t.index ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "advices", "components"
  add_foreign_key "components", "projects"
end
