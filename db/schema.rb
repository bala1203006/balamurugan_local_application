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

ActiveRecord::Schema.define(version: 20170618143956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "venue"
    t.string   "country"
    t.string   "city"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_speakers", force: :cascade do |t|
    t.integer "event_id"
    t.integer "speaker_id"
    t.index ["event_id"], name: "index_events_speakers_on_event_id", using: :btree
    t.index ["speaker_id"], name: "index_events_speakers_on_speaker_id", using: :btree
  end

  create_table "events_sponsors", force: :cascade do |t|
    t.integer "event_id"
    t.integer "sponsor_id"
    t.index ["event_id"], name: "index_events_sponsors_on_event_id", using: :btree
    t.index ["sponsor_id"], name: "index_events_sponsors_on_sponsor_id", using: :btree
  end

  create_table "events_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.index ["event_id"], name: "index_events_users_on_event_id", using: :btree
    t.index ["user_id"], name: "index_events_users_on_user_id", using: :btree
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "profession"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "role"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "phone_no"
  end

  add_foreign_key "events_speakers", "events"
  add_foreign_key "events_speakers", "speakers"
  add_foreign_key "events_sponsors", "events"
  add_foreign_key "events_sponsors", "sponsors"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users"
end
