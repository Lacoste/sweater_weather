ActiveRecord::Schema.define(version: 2019_06_01_232139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "search_name"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "state_abrev"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
