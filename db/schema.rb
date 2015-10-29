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

ActiveRecord::Schema.define(version: 20150321134632) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",                               null: false
    t.text     "description"
    t.text     "body"
    t.string   "slug"
    t.text     "tags"
    t.integer  "priority",            default: 0
    t.boolean  "hidden",              default: false
    t.boolean  "deleted",             default: false
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "header_file_name"
    t.string   "header_content_type"
    t.integer  "header_file_size"
    t.datetime "header_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "carry_rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",            default: 2000
    t.integer  "current_position", default: 0
    t.integer  "last_position",    default: 0
    t.integer  "matches",          default: 0
    t.integer  "wins",             default: 0
    t.integer  "loses",            default: 0
    t.integer  "kills",            default: 0
    t.integer  "deaths",           default: 0
    t.integer  "assists",          default: 0
    t.integer  "last_hits",        default: 0
    t.integer  "denies",           default: 0
    t.integer  "top_gold_per_min", default: 0
    t.integer  "top_xp_per_min",   default: 0
    t.integer  "penalties",        default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "carry_rankings", ["user_id"], name: "index_carry_rankings_on_user_id"

  create_table "dota_heros", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "dota_hero_id"
    t.integer  "player_slot"
    t.integer  "level",        default: 0
    t.integer  "kills",        default: 0
    t.integer  "deaths",       default: 0
    t.integer  "assists",      default: 0
    t.integer  "gold",         default: 0
    t.integer  "last_hits",    default: 0
    t.integer  "denies",       default: 0
    t.integer  "gold_per_min", default: 0
    t.integer  "xp_per_min",   default: 0
    t.integer  "role",         default: 0
    t.integer  "penalty",      default: 0
    t.boolean  "victory",      default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "match_details", ["dota_hero_id"], name: "index_match_details_on_dota_hero_id"
  add_index "match_details", ["match_id"], name: "index_match_details_on_match_id"
  add_index "match_details", ["user_id"], name: "index_match_details_on_user_id"

  create_table "matches", force: :cascade do |t|
    t.string   "description"
    t.boolean  "radiant_win", default: true
    t.string   "match_id"
    t.integer  "game_mode"
    t.integer  "duration",    default: 0
    t.datetime "start_time"
    t.boolean  "processed",   default: false
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "matches", ["user_id"], name: "index_matches_on_user_id"

  create_table "mid_rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",            default: 2000
    t.integer  "current_position", default: 0
    t.integer  "last_position",    default: 0
    t.integer  "matches",          default: 0
    t.integer  "wins",             default: 0
    t.integer  "loses",            default: 0
    t.integer  "kills",            default: 0
    t.integer  "deaths",           default: 0
    t.integer  "assists",          default: 0
    t.integer  "last_hits",        default: 0
    t.integer  "denies",           default: 0
    t.integer  "top_gold_per_min", default: 0
    t.integer  "top_xp_per_min",   default: 0
    t.integer  "penalties",        default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "mid_rankings", ["user_id"], name: "index_mid_rankings_on_user_id"

  create_table "offlane_rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",            default: 2000
    t.integer  "current_position", default: 0
    t.integer  "last_position",    default: 0
    t.integer  "matches",          default: 0
    t.integer  "wins",             default: 0
    t.integer  "loses",            default: 0
    t.integer  "kills",            default: 0
    t.integer  "deaths",           default: 0
    t.integer  "assists",          default: 0
    t.integer  "last_hits",        default: 0
    t.integer  "denies",           default: 0
    t.integer  "top_gold_per_min", default: 0
    t.integer  "top_xp_per_min",   default: 0
    t.integer  "penalties",        default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "offlane_rankings", ["user_id"], name: "index_offlane_rankings_on_user_id"

  create_table "rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",            default: 2000
    t.integer  "current_position", default: 0
    t.integer  "last_position",    default: 0
    t.integer  "matches",          default: 0
    t.integer  "wins",             default: 0
    t.integer  "loses",            default: 0
    t.integer  "kills",            default: 0
    t.integer  "deaths",           default: 0
    t.integer  "assists",          default: 0
    t.integer  "last_hits",        default: 0
    t.integer  "denies",           default: 0
    t.integer  "top_gold_per_min", default: 0
    t.integer  "top_xp_per_min",   default: 0
    t.integer  "penalties",        default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "rankings", ["user_id"], name: "index_rankings_on_user_id"

  create_table "support_rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",            default: 2000
    t.integer  "current_position", default: 0
    t.integer  "last_position",    default: 0
    t.integer  "matches",          default: 0
    t.integer  "wins",             default: 0
    t.integer  "loses",            default: 0
    t.integer  "kills",            default: 0
    t.integer  "deaths",           default: 0
    t.integer  "assists",          default: 0
    t.integer  "last_hits",        default: 0
    t.integer  "denies",           default: 0
    t.integer  "top_gold_per_min", default: 0
    t.integer  "top_xp_per_min",   default: 0
    t.integer  "penalties",        default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "support_rankings", ["user_id"], name: "index_support_rankings_on_user_id"

  create_table "tinymce_images", force: :cascade do |t|
    t.string   "alt"
    t.string   "hint"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",      default: "steam"
    t.string   "uid"
    t.string   "nickname"
    t.string   "real_name"
    t.string   "system_name"
    t.string   "profile_url"
    t.string   "avatar_url"
    t.string   "visible_state"
    t.string   "steamid"
    t.string   "location"
    t.boolean  "admin",         default: false
    t.datetime "last_seen"
    t.datetime "time_created"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "birth_country"
    t.string   "home_country"
    t.string   "ip_country"
    t.string   "register_ip"
    t.string   "last_login_ip"
  end

end
