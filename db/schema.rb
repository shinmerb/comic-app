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

ActiveRecord::Schema[7.1].define(version: 2024_04_08_131822) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comic_authors", force: :cascade do |t|
    t.integer "comic_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comic_authors_on_author_id"
    t.index ["comic_id"], name: "index_comic_authors_on_comic_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string "name"
    t.date "published_on"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "publisher_id", null: false
    t.index ["publisher_id"], name: "index_comics_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comic_authors", "authors"
  add_foreign_key "comic_authors", "comics"
  add_foreign_key "comics", "publishers"
end
