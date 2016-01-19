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

ActiveRecord::Schema.define(version: 20151214124728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string   "layer"
    t.string   "name"
    t.string   "type"
    t.float    "value"
    t.float    "percentile"
    t.boolean  "inverted",   default: false
    t.integer  "policy_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.integer  "policy_id"
    t.datetime "last_available_at"
    t.datetime "resolved_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string   "layer"
    t.string   "name"
    t.float    "value"
    t.string   "host"
    t.datetime "valid_until"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
