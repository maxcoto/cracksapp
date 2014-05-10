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

ActiveRecord::Schema.define(version: 20140509040219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "kind"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", force: true do |t|
    t.string   "number"
    t.text     "title"
    t.text     "url"
    t.string   "last_visited"
    t.string   "created"
    t.boolean  "is_bookmark"
    t.integer  "visits"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "date"
    t.string   "duration"
    t.string   "phone"
    t.string   "kind"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "phones"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "finger"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.string   "date"
    t.string   "accuracy"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms", force: true do |t|
    t.string   "number"
    t.string   "thread_number"
    t.string   "address"
    t.string   "person"
    t.string   "date"
    t.string   "protocol"
    t.string   "read"
    t.string   "status"
    t.string   "reply_path_present"
    t.string   "subject"
    t.text     "body"
    t.string   "service_center"
    t.string   "locked"
    t.string   "kind"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socials", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "kind"
    t.string   "comments"
    t.string   "contact_number"
    t.string   "raw_contact_number"
    t.text     "body"
    t.string   "timestamp"
    t.string   "sync1"
    t.string   "sync2"
    t.string   "sync3"
    t.string   "sync4"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
