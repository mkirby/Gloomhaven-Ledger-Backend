# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_02_203825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string "fullname"
    t.string "name"
    t.string "name_hidden"
    t.string "abbreviation"
    t.integer "max_ability_cards"
    t.integer "events_on_unlock"
    t.integer "events_on_retirement"
    t.string "img_mat_front"
    t.string "img_mat_back"
    t.string "img_portrait"
    t.string "img_icon"
    t.json "health"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "party_id", null: false
    t.string "name"
    t.integer "level"
    t.integer "experience"
    t.integer "gold"
    t.integer "checkmarks"
    t.boolean "active"
    t.boolean "retired"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "character_class_id", null: false
    t.string "notes"
    t.index ["character_class_id"], name: "index_characters_on_character_class_id"
    t.index ["party_id"], name: "index_characters_on_party_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.integer "reputation"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_parties_on_campaign_id"
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "campaign_id", null: false
    t.boolean "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_user_campaigns_on_campaign_id"
    t.index ["user_id"], name: "index_user_campaigns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "character_classes"
  add_foreign_key "characters", "parties"
  add_foreign_key "characters", "users"
  add_foreign_key "parties", "campaigns"
  add_foreign_key "user_campaigns", "campaigns"
  add_foreign_key "user_campaigns", "users"
end
