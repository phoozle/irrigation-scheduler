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

ActiveRecord::Schema.define(version: 2020_01_27_024144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schedules", force: :cascade do |t|
    t.integer "days", default: [], array: true
    t.time "times", default: [], array: true
    t.boolean "rain_skip", default: false
    t.integer "temperature_threshold", default: 0
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration_minutes"
    t.index ["zone_id"], name: "index_schedules_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.text "name"
    t.text "on_url"
    t.text "off_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
