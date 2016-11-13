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

ActiveRecord::Schema.define(version: 20161112184228) do

  create_table "cds", force: :cascade do |t|
    t.string  "name"
    t.integer "comedian_id"
    t.string  "year"
  end

  create_table "comedian_fans", force: :cascade do |t|
    t.integer "comedian_id"
    t.integer "fan_id"
  end

  create_table "comedians", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "bio"
  end

  create_table "fans", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
  end

  create_table "shows", force: :cascade do |t|
    t.string "date"
    t.string "venue"
  end

  create_table "specials", force: :cascade do |t|
    t.string  "name"
    t.integer "comedian_id"
  end

end
