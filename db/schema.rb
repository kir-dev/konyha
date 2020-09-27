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

ActiveRecord::Schema.define(version: 2020_09_27_185902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appliance_comments", force: :cascade do |t|
    t.integer "category"
    t.text "body"
    t.bigint "appliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appliance_id"], name: "index_appliance_comments_on_appliance_id"
  end

  create_table "appliances", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.integer "status"
    t.text "description"
    t.bigint "kitchen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kitchen_id"], name: "index_appliances_on_kitchen_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.integer "floor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appliance_comments", "appliances"
  add_foreign_key "appliances", "kitchens"
end
