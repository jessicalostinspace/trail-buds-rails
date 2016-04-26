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

ActiveRecord::Schema.define(version: 20160426174532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id", using: :btree
  add_index "attendees", ["user_id"], name: "index_attendees_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "trailName"
    t.string   "meetingLocation"
    t.string   "hikeDistance"
    t.string   "elevationGain"
    t.string   "hikeLocation"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "description"
    t.integer  "user_id"
    t.string   "maxAttendees"
    t.string   "eventDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "facebook_id"
    t.string   "gender"
    t.string   "picture_url"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "coverPhotoURL"
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "users"
  add_foreign_key "events", "users"
end
