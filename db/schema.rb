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

ActiveRecord::Schema.define(version: 20130819111725) do

  create_table "orders", force: true do |t|
    t.string   "state",       default: "created", null: false
    t.text     "description"
    t.integer  "speaker_id"
    t.integer  "client_id"
    t.boolean  "hidden"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"
  add_index "orders", ["speaker_id"], name: "index_orders_on_speaker_id"

  create_table "speakers", force: true do |t|
    t.integer  "user_id"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakers", ["user_id"], name: "index_speakers_on_user_id"

end
