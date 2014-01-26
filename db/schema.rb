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

ActiveRecord::Schema.define(version: 20140126091703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptable_order_categories_speakers", force: true do |t|
    t.integer "order_category_id", null: false
    t.integer "speaker_id",        null: false
  end

  add_index "acceptable_order_categories_speakers", ["order_category_id"], name: "index_acceptable_order_categories_speakers_on_order_category_id", using: :btree
  add_index "acceptable_order_categories_speakers", ["speaker_id"], name: "index_acceptable_order_categories_speakers_on_speaker_id", using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "age_types", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "age_types_speakers", force: true do |t|
    t.integer "age_type_id"
    t.integer "speaker_id"
  end

  add_index "age_types_speakers", ["age_type_id"], name: "index_age_types_speakers_on_age_type_id", using: :btree
  add_index "age_types_speakers", ["speaker_id"], name: "index_age_types_speakers_on_speaker_id", using: :btree

  create_table "billing_accounts", force: true do |t|
    t.integer  "balance"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_accounts", ["user_id"], name: "index_billing_accounts_on_user_id", using: :btree

  create_table "billing_operations", force: true do |t|
    t.integer  "account_id",    null: false
    t.integer  "document_id",   null: false
    t.string   "document_type", null: false
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_operations", ["account_id"], name: "index_billing_operations_on_account_id", using: :btree
  add_index "billing_operations", ["document_id", "document_type"], name: "index_billing_operations_on_document_id_and_document_type", using: :btree

  create_table "billing_transfers", force: true do |t|
    t.integer  "value",                null: false
    t.integer  "recipient_account_id", null: false
    t.integer  "sender_account_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_transfers", ["recipient_account_id"], name: "index_billing_transfers_on_recipient_account_id", using: :btree
  add_index "billing_transfers", ["sender_account_id"], name: "index_billing_transfers_on_sender_account_id", using: :btree

  create_table "order_categories", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "state",       default: "created", null: false
    t.text     "description"
    t.integer  "speaker_id"
    t.integer  "client_id"
    t.boolean  "hidden"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
    t.integer  "duration"
    t.string   "name"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["speaker_id"], name: "index_orders_on_speaker_id", using: :btree

  create_table "speakers", force: true do |t|
    t.integer  "user_id"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timbre_level",   null: false
    t.integer  "sex",            null: false
  end

  add_index "speakers", ["sex"], name: "index_speakers_on_sex", using: :btree
  add_index "speakers", ["user_id"], name: "index_speakers_on_user_id", using: :btree

  create_table "speakers_voice_types", force: true do |t|
    t.integer "speaker_id"
    t.integer "voice_type_id"
  end

  add_index "speakers_voice_types", ["speaker_id"], name: "index_speakers_voice_types_on_speaker_id", using: :btree
  add_index "speakers_voice_types", ["voice_type_id"], name: "index_speakers_voice_types_on_voice_type_id", using: :btree

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
    t.string   "phone"
    t.string   "login"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voice_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

end
