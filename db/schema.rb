ActiveRecord::Schema.define(version: 2019_08_11_215009) do

  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "booked_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_booked_rooms_on_room_id"
    t.index ["user_id"], name: "index_booked_rooms_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "post_code"
    t.integer "distance_from"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "p_number"
    t.string "address"
    t.string "company_email"
    t.integer "company_serial"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.integer "stars"
    t.text "description"
    t.bigint "city_id"
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_hotels_on_city_id"
    t.index ["company_id"], name: "index_hotels_on_company_id"
    t.index ["country_id"], name: "index_hotels_on_country_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "room_id"
    t.date "reservation_from"
    t.date "reservation_to"
    t.string "card_owner_email"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "description"
    t.date "available_from"
    t.date "available_to"
    t.integer "number_of_guests"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "f_name"
    t.string "l_name"
    t.boolean "admin", default: false
    t.boolean "has_company", default: false
    t.string "stripe_customer_id"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "booked_rooms", "rooms"
  add_foreign_key "booked_rooms", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "companies", "users"
  add_foreign_key "hotels", "cities"
  add_foreign_key "hotels", "companies"
  add_foreign_key "hotels", "countries"
  add_foreign_key "hotels", "users"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "rooms", "hotels"
end
