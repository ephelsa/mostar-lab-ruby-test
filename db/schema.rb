# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_25_155555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "casts", primary_key: "cast_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "person", null: false
    t.text "interpretation", null: false
    t.integer "movie_id", null: false
    t.index ["cast_id"], name: "index_casts_on_cast_id"
    t.index ["movie_id"], name: "index_casts_on_movie_id"
  end

  create_table "favourites", id: false, force: :cascade do |t|
    t.uuid "user_id"
    t.integer "movie_id"
    t.index ["movie_id", "user_id"], name: "index_favourites_on_movie_id_and_user_id", unique: true
    t.index ["movie_id"], name: "index_favourites_on_movie_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "movies", primary_key: "movie_id", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.text "description"
    t.date "release_date"
    t.integer "duration"
    t.integer "rate"
    t.integer "earns"
    t.text "image_url"
    t.index ["movie_id"], name: "index_movies_on_movie_id"
  end

  create_table "movies_tags", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "tag_id", null: false
    t.index ["movie_id", "tag_id"], name: "index_movies_tags_on_movie_id_and_tag_id", unique: true
  end

  create_table "tags", primary_key: "tag_id", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.index ["tag_id"], name: "index_tags_on_tag_id"
  end

  create_table "users", primary_key: "user_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "full_name", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.index ["user_id"], name: "index_users_on_user_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "casts", "movies", primary_key: "movie_id"
  add_foreign_key "favourites", "movies", primary_key: "movie_id"
  add_foreign_key "favourites", "users", primary_key: "user_id"
  add_foreign_key "movies_tags", "movies", primary_key: "movie_id"
  add_foreign_key "movies_tags", "tags", primary_key: "tag_id"
end
