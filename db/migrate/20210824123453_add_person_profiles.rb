class AddPersonProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :person_profiles do |t|
      t.string :role_holder_name
      t.string :honours_post_nominal_letters
      t.text :achievements_in_role
      t.text :career_achievements
      t.text :education
      t.string :all_publications_url
      t.integer :supervisor_availability
      t.text :research_interests
      t.text :current_research_projects
      t.string :person_finder_link
      t.string :subtype
      t.text :role_related_posts_held
      t.text :courses_taught_undergrad
      t.text :courses_taught_postgrad
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :role_holder_title
      t.string :pure_portal_url

      t.timestamps null: false
    end
  end
end
