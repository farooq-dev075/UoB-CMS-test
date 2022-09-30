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

ActiveRecord::Schema.define(version: 2021_08_24_123453) do

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

end
