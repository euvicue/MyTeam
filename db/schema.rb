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

ActiveRecord::Schema.define(version: 20140323173745) do

  create_table "admins", force: true do |t|
    t.string   "username",               default: "admin",           null: false
    t.string   "email",                  default: "admin@admin.com", null: false
    t.string   "encrypted_password",     default: "",                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_days", force: true do |t|
    t.integer  "number"
    t.datetime "deadline"
    t.datetime "weekend_date"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_days", ["league_id"], name: "index_match_days_on_league_id"

  create_table "player_points", force: true do |t|
    t.integer  "match_day_id"
    t.integer  "player_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_points", ["match_day_id"], name: "index_player_points_on_match_day_id"
  add_index "player_points", ["player_id"], name: "index_player_points_on_player_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "realteam"
    t.string   "shirt"
    t.string   "position"
    t.string   "nacionality"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "player_id"
    t.integer  "d1"
    t.integer  "d2"
    t.integer  "d3"
    t.integer  "d4"
    t.integer  "d5"
    t.integer  "d6"
    t.integer  "d7"
    t.integer  "d8"
    t.integer  "d9"
    t.integer  "d10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["player_id"], name: "index_points_on_player_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["league_id"], name: "index_posts_on_league_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "team_players", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_players", ["player_id"], name: "index_team_players_on_player_id"
  add_index "team_players", ["team_id", "player_id"], name: "index_team_players_on_team_id_and_player_id", unique: true
  add_index "team_players", ["team_id"], name: "index_team_players_on_team_id"

  create_table "team_points", force: true do |t|
    t.integer  "match_day_id"
    t.integer  "team_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_points", ["match_day_id"], name: "index_team_points_on_match_day_id"
  add_index "team_points", ["team_id"], name: "index_team_points_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id"
  add_index "teams", ["name", "user_id", "league_id"], name: "index_teams_on_name_and_user_id_and_league_id", unique: true
  add_index "teams", ["name"], name: "index_teams_on_name"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "transfer_markets", force: true do |t|
    t.integer  "value"
    t.integer  "league_id"
    t.integer  "team_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transfer_markets", ["league_id"], name: "index_transfer_markets_on_league_id"
  add_index "transfer_markets", ["team_player_id"], name: "index_transfer_markets_on_team_player_id"

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
