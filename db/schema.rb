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

ActiveRecord::Schema[7.0].define(version: 2022_09_15_034008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dictionaries", force: :cascade do |t|
    t.bigint "source_id"
    t.bigint "target_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_dictionaries_on_name", unique: true
    t.index ["source_id"], name: "index_dictionaries_on_source_id"
    t.index ["target_id"], name: "index_dictionaries_on_target_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "source"
    t.string "target"
    t.integer "classif"
    t.integer "gender"
    t.bigint "dictionary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dictionary_id"], name: "index_entries_on_dictionary_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbrev"
    t.string "special_chars", default: ""
    t.index ["abbrev"], name: "index_languages_on_abbrev", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  add_foreign_key "dictionaries", "languages", column: "source_id"
  add_foreign_key "dictionaries", "languages", column: "target_id"
  add_foreign_key "entries", "dictionaries"
end
