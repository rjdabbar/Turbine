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

ActiveRecord::Schema.define(version: 20131218003210) do

  create_table "friends", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "avatar"
    t.string   "persona_state"
    t.string   "profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "steam_id"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.string   "game_id"
    t.string   "name"
    t.string   "logo_url"
    t.string   "icon_url"
    t.string   "playtime_life"
    t.string   "playtime_2weeks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "steam_id"
    t.string   "avatar"
    t.string   "avatar_medium"
    t.string   "avatar_full"
    t.string   "persona_state"
    t.string   "profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "stats", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["game_id"], name: "index_stats_on_game_id"
  add_index "stats", ["user_id"], name: "index_stats_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
