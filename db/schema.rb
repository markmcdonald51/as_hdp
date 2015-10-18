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

ActiveRecord::Schema.define(version: 20151007151903) do

  create_table "artists", force: :cascade do |t|
    t.integer  "artistable_id"
    t.string   "artistable_type"
    t.string   "name"
    t.string   "subtitle"
    t.text     "summary"
    t.integer  "site_section_id"
    t.string   "aasm_state"
    t.integer  "layout_id"
    t.integer  "position"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "artists", ["artistable_type", "artistable_id"], name: "index_artists_on_artistable_type_and_artistable_id"
  add_index "artists", ["site_section_id"], name: "index_artists_on_site_section_id"

  create_table "attachments", force: :cascade do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "name"
    t.text     "summary"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "position"
    t.string   "usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  add_index "attachments", ["usage"], name: "index_attachments_on_usage"

  create_table "categories", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.integer  "categorical_id"
    t.string   "categorical_type"
    t.boolean  "use_first_image_as_icon", default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "categories", ["categorical_type", "categorical_id"], name: "index_categories_on_categorical_type_and_categorical_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.float    "lat"
    t.float    "lng"
    t.integer  "clientele_id"
    t.string   "clientele_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "clients", ["clientele_type", "clientele_id"], name: "index_clients_on_clientele_type_and_clientele_id"

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "summary"
    t.text     "body"
    t.date     "date_of_creation"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.string   "aasm_state"
    t.string   "usage"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "documents", ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "farms", ["user_id"], name: "index_farms_on_user_id"

  create_table "item_measurements", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "unit_of_measurement_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "item_measurements", ["item_id"], name: "index_item_measurements_on_item_id"
  add_index "item_measurements", ["unit_of_measurement_id"], name: "index_item_measurements_on_unit_of_measurement_id"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "subheading"
    t.date     "date_of_creation"
    t.text     "summary"
    t.date     "date_available"
    t.date     "date_unavailable"
    t.integer  "units_available"
    t.boolean  "preorder"
    t.string   "ancestry"
    t.float    "unit_price"
    t.string   "youtube_url"
    t.integer  "position"
    t.float    "lat"
    t.float    "lng"
    t.string   "location"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.string   "usage"
    t.boolean  "visible"
    t.string   "aasm_state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "items", ["itemable_type", "itemable_id"], name: "index_items_on_itemable_type_and_itemable_id"

  create_table "locations", force: :cascade do |t|
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "locations", ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"

  create_table "partials", force: :cascade do |t|
    t.string   "name"
    t.string   "rails_path"
    t.string   "sample_url"
    t.string   "aasm_string"
    t.string   "usage"
    t.integer  "partialable_id"
    t.string   "partialable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "partials", ["partialable_type", "partialable_id"], name: "index_partials_on_partialable_type_and_partialable_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile_phone"
    t.float    "lat"
    t.float    "lng"
    t.string   "address"
    t.string   "skype"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "people", ["contactable_type", "contactable_id"], name: "index_people_on_contactable_type_and_contactable_id"

  create_table "site_sections", force: :cascade do |t|
    t.string   "name"
    t.string   "subheading"
    t.text     "summary"
    t.integer  "position"
    t.boolean  "visible"
    t.integer  "layout_id"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measurements", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "image_url"
    t.string   "oauth_token"
    t.string   "aasm_state"
    t.string   "country_code"
    t.string   "postal_code"
    t.decimal  "lat",          precision: 15, scale: 10
    t.decimal  "lng",          precision: 15, scale: 10
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
