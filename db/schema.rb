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

ActiveRecord::Schema.define(version: 20160130234554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_1",                             null: false
    t.string   "street_2"
    t.string   "city",                                 null: false
    t.string   "state",                                null: false
    t.string   "zip_code",                             null: false
    t.string   "country",    default: "United States", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "alleys", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bowlers", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "usbc_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bowlers", ["usbc_number"], name: "index_bowlers_on_usbc_number", unique: true, using: :btree

  create_table "bowlers_teams", id: false, force: :cascade do |t|
    t.integer "bowler_id", null: false
    t.integer "team_id",   null: false
  end

  add_index "bowlers_teams", ["bowler_id", "team_id"], name: "index_bowlers_teams_on_bowler_id_and_team_id", unique: true, using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name",                           null: false
    t.date     "start_date",                     null: false
    t.date     "end_date"
    t.string   "day"
    t.string   "time",                           null: false
    t.integer  "practice_length",                null: false
    t.integer  "alley_id",                       null: false
    t.integer  "frequency",                      null: false
    t.integer  "occurrences",                    null: false
    t.integer  "scratch",          default: 220
    t.integer  "handicap_percent", default: 80
    t.integer  "handicap_round",   default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "league_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end