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

ActiveRecord::Schema.define(version: 20150717141547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_user_relationships", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_user_relationships", ["job_id"], name: "index_job_user_relationships_on_job_id", using: :btree
  add_index "job_user_relationships", ["user_id", "job_id"], name: "index_job_user_relationships_on_user_id_and_job_id", unique: true, using: :btree
  add_index "job_user_relationships", ["user_id"], name: "index_job_user_relationships_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "valid_from"
    t.date     "valid_to"
    t.string   "salary"
    t.string   "type_of_contract"
    t.integer  "profession_id"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "jobs", ["profession_id"], name: "index_jobs_on_profession_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "summary"
    t.string   "text"
    t.boolean  "active"
    t.boolean  "prior"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", force: :cascade do |t|
    t.string   "area_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "address"
    t.integer  "post_code"
    t.integer  "contact"
    t.string   "personal_page"
    t.date     "birthday"
    t.string   "id_number"
    t.string   "presentation"
    t.string   "habits"
    t.string   "experience"
    t.integer  "type_of_users"
    t.boolean  "active",            default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "profession_id"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profession_id"], name: "index_users_on_profession_id", using: :btree

  add_foreign_key "jobs", "professions"
  add_foreign_key "jobs", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "professions"
end
