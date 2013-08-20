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

ActiveRecord::Schema.define(version: 20130820032310) do

  create_table "billing_accounts", force: true do |t|
    t.integer  "balance"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_accounts", ["user_id"], name: "index_billing_accounts_on_user_id"

  create_table "billing_operations", force: true do |t|
    t.integer  "account_id"
    t.integer  "document_id"
    t.string   "document_type"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_operations", ["account_id"], name: "index_billing_operations_on_account_id"
  add_index "billing_operations", ["document_id", "document_type"], name: "index_billing_operations_on_document_id_and_document_type"

  create_table "billing_transfers", force: true do |t|
    t.integer  "value"
    t.integer  "recipient_account_id"
    t.integer  "sender_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_transfers", ["recipient_account_id"], name: "index_billing_transfers_on_recipient_account_id"
  add_index "billing_transfers", ["sender_account_id"], name: "index_billing_transfers_on_sender_account_id"

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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end