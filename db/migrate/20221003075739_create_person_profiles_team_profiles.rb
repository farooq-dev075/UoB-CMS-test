class CreatePersonProfilesTeamProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :person_profiles_team_profiles do |t|
      t.references :person_profile, null: false, foreign_key: true
      t.references :team_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
