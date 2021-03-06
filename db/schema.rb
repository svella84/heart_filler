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

ActiveRecord::Schema.define(version: 20131208090521) do

  create_table "campaigns", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "target",                 precision: 10, scale: 2
    t.decimal  "budget",                 precision: 10, scale: 2, default: 0.0
    t.datetime "expiration"
    t.string   "image_url_file_name"
    t.string   "image_url_content_type"
    t.integer  "image_url_file_size"
    t.datetime "image_url_updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["category_id"], name: "index_campaigns_on_category_id"
  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", force: true do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "cost",        precision: 10, scale: 2
    t.boolean  "purchased",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goods", ["campaign_id"], name: "index_goods_on_campaign_id"

  create_table "information", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "post_code"
    t.string   "phone"
    t.decimal  "credit",                 precision: 10, scale: 2, default: 0.0, null: false
    t.string   "image_url_file_name"
    t.string   "image_url_content_type"
    t.integer  "image_url_file_size"
    t.datetime "image_url_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "information", ["user_id"], name: "index_information_on_user_id"

  create_table "offers", force: true do |t|
    t.integer  "campaign_id",             null: false
    t.integer  "user_id",                 null: false
    t.integer  "good_id",     default: 0, null: false
    t.decimal  "donation"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["campaign_id"], name: "index_offers_on_campaign_id"
  add_index "offers", ["good_id"], name: "index_offers_on_good_id"
  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
