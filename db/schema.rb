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

ActiveRecord::Schema[7.0].define(version: 2022_10_22_162733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "source_id"
    t.bigint "target_id"
    t.index ["source_id"], name: "index_books_on_source_id"
    t.index ["target_id"], name: "index_books_on_target_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.string "special_chars", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_languages_on_abbreviation", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.string "word"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_sources_on_language_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "word"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_targets_on_language_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "source_id", null: false
    t.bigint "target_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_translations_on_book_id"
    t.index ["source_id"], name: "index_translations_on_source_id"
    t.index ["target_id"], name: "index_translations_on_target_id"
  end

  add_foreign_key "books", "languages", column: "source_id"
  add_foreign_key "books", "languages", column: "target_id"
  add_foreign_key "sources", "languages"
  add_foreign_key "targets", "languages"
  add_foreign_key "translations", "books"
  add_foreign_key "translations", "sources"
  add_foreign_key "translations", "targets"
end
