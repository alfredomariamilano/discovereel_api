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

ActiveRecord::Schema.define(version: 20161024161352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "tmdb_id"
    t.string   "title"
    t.string   "poster_path"
    t.string   "release_date"
    t.json     "images",       default: [],              array: true
    t.string   "overview"
    t.string   "imdb_id"
    t.json     "videos",       default: [],              array: true
    t.string   "genres"
    t.string   "vote_average"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "viewings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "watched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_viewings_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_viewings_on_user_id", using: :btree
  end

  add_foreign_key "viewings", "movies"
  add_foreign_key "viewings", "users"
end
