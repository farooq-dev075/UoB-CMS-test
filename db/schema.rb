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

ActiveRecord::Schema.define(version: 2022_10_03_075739) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "person_profiles", force: :cascade do |t|
    t.string "role_holder_name"
    t.string "honours_post_nominal_letters"
    t.text "achievements_in_role"
    t.text "career_achievements"
    t.text "education"
    t.string "all_publications_url"
    t.integer "supervisor_availability"
    t.text "research_interests"
    t.text "current_research_projects"
    t.string "person_finder_link"
    t.string "subtype"
    t.text "role_related_posts_held"
    t.text "courses_taught_undergrad"
    t.text "courses_taught_postgrad"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "role_holder_title"
    t.string "pure_portal_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_profiles_team_profiles", force: :cascade do |t|
    t.integer "person_profile_id", null: false
    t.integer "team_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_profile_id"], name: "index_person_profiles_team_profiles_on_person_profile_id"
    t.index ["team_profile_id"], name: "index_person_profiles_team_profiles_on_team_profile_id"
  end

  create_table "team_profiles", force: :cascade do |t|
    t.string "title", null: false
    t.text "summary", default: "", null: false
    t.string "subtype", default: "", null: false
    t.string "contact_name", default: "", null: false
    t.string "contact_email", default: "", null: false
    t.string "contact_phone", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "person_profiles_team_profiles", "person_profiles"
  add_foreign_key "person_profiles_team_profiles", "team_profiles"
end
