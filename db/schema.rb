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

ActiveRecord::Schema.define(version: 20171023015704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_answer_to_postbacks", force: :cascade do |t|
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "add_answer_to_postbacks", ["answer_id"], name: "index_add_answer_to_postbacks_on_answer_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "question",         default: [],              array: true
    t.text     "reply"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "basicbot_id"
    t.boolean  "exact_keyword"
    t.boolean  "multiple_answers"
    t.text     "multiple_options", default: [],              array: true
    t.string   "image"
  end

  add_index "answers", ["basicbot_id"], name: "index_answers_on_basicbot_id", using: :btree

  create_table "basicbots", force: :cascade do |t|
    t.string  "name"
    t.string  "access_token"
    t.string  "verify_token"
    t.string  "app_secret"
    t.string  "page_id"
    t.string  "welcome_greeting"
    t.string  "message_text"
    t.text    "greeting"
    t.boolean "get_started"
  end

  create_table "chats", force: :cascade do |t|
    t.text     "message"
    t.string   "sender_id"
    t.datetime "sent_at"
  end

  create_table "global_configs", force: :cascade do |t|
    t.string   "app_name"
    t.string   "app_domain"
    t.string   "facebook_app_id"
    t.string   "twitter_app_id"
    t.string   "linkedin_app_id"
    t.boolean  "use_slack",               default: false
    t.string   "slack_team"
    t.string   "slack_icon_url"
    t.string   "slack_user"
    t.string   "technical_support_email"
    t.string   "technical_slack_channel"
    t.string   "feedback_support_email"
    t.string   "feedback_slack_channel"
    t.string   "default_email_address"
    t.string   "default_slack_channel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "postbacks", force: :cascade do |t|
    t.string   "payload"
    t.text     "reply"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "basicbot_id"
    t.boolean  "multiple_answers"
    t.text     "multiple_options", default: [],              array: true
    t.integer  "answer_id"
    t.string   "image"
  end

  add_index "postbacks", ["answer_id"], name: "index_postbacks_on_answer_id", using: :btree
  add_index "postbacks", ["basicbot_id"], name: "index_postbacks_on_basicbot_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "add_answer_to_postbacks", "answers"
  add_foreign_key "answers", "basicbots"
  add_foreign_key "postbacks", "answers"
  add_foreign_key "postbacks", "basicbots"
end
