class CreateTeamProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :team_profiles do |t|
      t.string :title, null: false, unique: true
      t.text :summary, null: false, default: ''
      t.string :subtype, null: false, default: ''
      t.string :contact_name, null: false, default: ''
      t.string :contact_email, null: false, default: ''
      t.string :contact_phone, null: false, default: ''

      t.timestamps
    end
  end
end
